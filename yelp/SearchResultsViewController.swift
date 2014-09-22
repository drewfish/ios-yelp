//
//  SearchResultsViewController.swift
//  yelp
//
//  Created by Andrew Folta on 9/18/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, YelpSearchDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var businesses: [YelpBusiness] = []

    @IBAction func onFilter() {
        // FUTURE -- probably nothing to do here, since push is already setup
    }

    @IBAction func onSearch() {
        search()
        searchBar.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        search()
    }

    func search() {
        MMProgressHUD.showWithStatus("Loading...")
        yelpModel.search(searchBar.text!, done: {
            (businesses: [YelpBusiness], error: NSError?) in
            MMProgressHUD.dismiss()
            if error != nil {
                // TODO -- show error
                println("------------------------------------ SEARCH ERROR")
                println(error!)
                return
            }
            self.businesses = businesses
            self.tableView.reloadData()
        })
    }

//    override func viewWillAppear(animated: Bool) {
//        println("SEARCH --viewWillAppear --pvc \(self.presentedViewController)")
//    }

//    override func viewDidAppear(animated: Bool) {
//        println("SEARCH --viewDidAppear --pvc \(self.presentedViewController)")
//    }

    func yelpSearch() {
        // By starting the search now we can do the asynchronous search while the segue is happening.
        search()
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        search()
        searchBar.resignFirstResponder()
    }

//    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//        println("SEARCH --searchBar --cancelButton --text \(searchBar.text)")
//    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }

    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as BusinessCell
        var business = businesses[indexPath.row]
        cell.formatFromBusiness(indexPath.row, business: business)
        return cell
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }

    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject!) {
        (segue!.destinationViewController as FiltersViewController).delegate = self
    }
}
