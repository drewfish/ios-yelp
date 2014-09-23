//
//  FiltersViewController.swift
//  yelp
//
//  Created by Andrew Folta on 9/19/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit


// constants
let SECTION_HEADINGS = [
    "Price",
    "Most Popular",
    "Distance",
    "Sort By",
    "Categories"
]
let SORTBY_OPTIONS = [
    (id: "0", title: "Best Matched"),
    (id: "1", title: "Distance"),
    (id: "2", title: "Highest Rated"),
]
let DISTANCE_OPTIONS = [
    (id: "0", title: "Auto"),
    (id: "100", title: "2 blocks"),
    (id: "300", title: "6 blocks"),
    (id: "1600", title: "1 mile"),
    (id: "8000", title: "5 miles"),
]


class FiltersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var delegate: YelpSearchDelegate?
    var haveDeals = false
    var sortbySection = RowSelectSingle()
    var distanceSection = RowSelectSingle()
    var categoriesSection = RowSelectMultiple()

    @IBAction func onCancel() {
        // this is all we need to do
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onSearch() {
        yelpModel.settings.distance = distanceSection.chosenID.toInt()!
        yelpModel.settings.sortBy = sortbySection.chosenID.toInt()!
        yelpModel.settings.haveDeals = haveDeals
        yelpModel.settings.categories = categoriesSection.chosenIDs
        delegate?.yelpSearch()
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        sortbySection.options = SORTBY_OPTIONS
        distanceSection.options = DISTANCE_OPTIONS
        categoriesSection.options = yelpModel.categories.map { (id: $0.id, title: $0.name) }
        haveDeals = yelpModel.settings.haveDeals
        sortbySection.chosenID = "\(yelpModel.settings.sortBy)"
        distanceSection.chosenID = "\(yelpModel.settings.distance)"
        categoriesSection.chosenIDs = yelpModel.settings.categories
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return SECTION_HEADINGS.count
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SECTION_HEADINGS[section]
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 4
        case 2: return distanceSection.numberOfRows()
        case 3: return sortbySection.numberOfRows()
        default: // case 4: categories
            return categoriesSection.numberOfRows()
        }
    }

    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return self.tableView.dequeueReusableCellWithIdentifier("PriceCell") as UITableViewCell
        case 1:
            var cell = self.tableView.dequeueReusableCellWithIdentifier("SelectOptionCell") as SelectOptionCell
            switch indexPath.row {
            case 0:
                cell.titleLabel.text = "Open Now"
                cell.enableSwitch.on = false
                cell.enableSwitch.enabled = false
                cell.userInteractionEnabled = false
            case 1:
                cell.titleLabel.text = "Hot & New"
                cell.enableSwitch.on = false
                cell.enableSwitch.enabled = false
                cell.userInteractionEnabled = false
            case 2:
                cell.titleLabel.text = "Offering a Deal"
                cell.enableSwitch.on = haveDeals
            default:    // case 3
                cell.titleLabel.text = "Delivery"
                cell.enableSwitch.on = false
                cell.enableSwitch.enabled = false
                cell.userInteractionEnabled = false
            }
            return cell
        case 2:
            return distanceSection.createCell(self.tableView, row: indexPath.row)
        case 3:
            return sortbySection.createCell(self.tableView, row: indexPath.row)
        default: // case 4: categories
            return categoriesSection.createCell(self.tableView, row: indexPath.row)
        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.section {
        case 0: return
        case 1:
            var cell = self.tableView.cellForRowAtIndexPath(indexPath) as SelectOptionCell
            haveDeals = !haveDeals
            cell.enableSwitch.on = haveDeals
            cell.selected = false
        case 2:
            distanceSection.rowSelected(self.tableView, indexPath: indexPath)
        case 3:
            sortbySection.rowSelected(self.tableView, indexPath: indexPath)
        default: // case 4: categories
            categoriesSection.rowSelected(self.tableView, indexPath: indexPath)
        }
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }

//    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject!) {
//        println("FILTERS --segue --dest \(segue?.destinationViewController)")
//    }

    class RowSelectSingle {
        var isExpanded = false
        var options: [(id: String, title: String)] = []
        var chosenRow: Int = 0
        var chosenID: String {
            get {
                return options[chosenRow].id
            }
            set {
                for (o, option) in enumerate(options) {
                    if option.id == newValue {
                        chosenRow = o
                        return
                    }
                }
                chosenRow = 0
            }
        }

        func numberOfRows() -> Int {
            return isExpanded ? options.count : 1
        }

        func createCell(tableView: UITableView, row: Int) -> UITableViewCell {
            var cell = tableView.dequeueReusableCellWithIdentifier("SelectOptionCell") as SelectOptionCell
            if isExpanded {
                var option = options[row]
                cell.titleLabel.text = option.title
                cell.enableSwitch.on = (row == chosenRow)
            }
            else {
                var option = options[chosenRow]
                cell.titleLabel.text = option.title
                cell.enableSwitch.on = true
            }
            // for some reason some cells are being disabled
            cell.enableSwitch.enabled = true
            cell.userInteractionEnabled = true
            return cell
        }

        func rowSelected(tableView: UITableView, indexPath: NSIndexPath) {
            if !isExpanded || chosenRow == indexPath.row {
                isExpanded = !isExpanded
            }
            else {
                chosenRow = indexPath.row
                for (o, option) in enumerate(options) {
                    var oIndex = NSIndexPath(forRow: o, inSection: indexPath.section)
                    var cell = tableView.cellForRowAtIndexPath(oIndex)
                    // cell might be offscreen and therefor not really exist
                    if let gotCell = cell as? SelectOptionCell {
                        gotCell.enableSwitch.on = (o == chosenRow)
                    }
                }
                isExpanded = false
            }
            tableView.reloadSections(NSIndexSet(index: indexPath.section), withRowAnimation: .Automatic)
            // TODO -- scroll tableView so that section is more prominent
        }
    }


    class RowSelectMultiple {
        var isExpanded = false
        var options: [(id: String, title: String)] = []
        var chosenRows: [Int] = []
        var chosenIDs: [String] {
            get {
                return chosenRows.map {
                    self.options[$0].id
                }
            }
            set {
                var nsChosenIDs = NSArray(array: newValue)
                var chosen: [Int] = []
                for (o, option) in enumerate(options) {
                    if nsChosenIDs.containsObject(option.id) {
                        chosen.append(o)
                    }
                }
                chosenRows = chosen
            }
        }

        func numberOfRows() -> Int {
            return isExpanded ? options.count + 1 : chosenRows.count + 1
        }

        func createCell(tableView: UITableView, row: Int) -> UITableViewCell {
            if isExpanded {
                if row == options.count {
                    var cell = tableView.dequeueReusableCellWithIdentifier("SelectToggleCell") as SelectToggleCell
                    cell.titleLabel.text = "Hide"
                    return cell
                }
                else {
                    var cell = tableView.dequeueReusableCellWithIdentifier("SelectOptionCell") as SelectOptionCell
                    var option = options[row]
                    cell.titleLabel.text = option.title
                    var nsChosenRows = NSArray(array: chosenRows)
                    cell.enableSwitch.on = nsChosenRows.containsObject(row)
                    // for some reason some cells are being disabled
                    cell.enableSwitch.enabled = true
                    cell.userInteractionEnabled = true
                    return cell
                }
            }
            else {
                if row == chosenRows.count {
                    var cell = tableView.dequeueReusableCellWithIdentifier("SelectToggleCell") as SelectToggleCell
                    cell.titleLabel.text = "Show All"
                    return cell
                }
                else {
                    var cell = tableView.dequeueReusableCellWithIdentifier("SelectOptionCell") as SelectOptionCell
                    var option = options[chosenRows[row]]
                    cell.titleLabel.text = option.title
                    cell.enableSwitch.on = true
                    // for some reason some cells are being disabled
                    cell.enableSwitch.enabled = true
                    cell.userInteractionEnabled = true
                    return cell
                }
            }
        }

        func rowSelected(tableView: UITableView, indexPath: NSIndexPath) {
            var nsChosenRows = NSArray(array: chosenRows)
            var drop: Int?
            if isExpanded {
                if indexPath.row == options.count {
                    isExpanded = false
                    tableView.reloadSections(NSIndexSet(index: indexPath.section), withRowAnimation: .Automatic)
                }
                else {
                    // toggle tapped row
                    var cell = tableView.cellForRowAtIndexPath(indexPath) as SelectOptionCell
                    if nsChosenRows.containsObject(indexPath.row) {
                        cell.enableSwitch.on = false
                        drop = indexPath.row
                    }
                    else {
                        cell.enableSwitch.on = true
                        chosenRows.append(indexPath.row)
                        // sort so that choice order doesn't determine display order while collapsed
                        chosenRows.sort { $0 < $1 }
                    }
                }
            }
            else {
                if indexPath.row == chosenRows.count {
                    isExpanded = true
                    tableView.reloadSections(NSIndexSet(index: indexPath.section), withRowAnimation: .Automatic)
                }
                else {
                    // drop tapped row from chosenRows
                    drop = chosenRows[indexPath.row]
                }
            }
            if drop != nil {
                chosenRows = chosenRows.filter() { $0 != drop! }
                if !isExpanded {
                    tableView.reloadSections(NSIndexSet(index: indexPath.section), withRowAnimation: .Automatic)
                }
            }
        }
    }


}
