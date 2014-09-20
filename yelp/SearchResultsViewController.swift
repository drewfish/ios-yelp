//
//  SearchResultsViewController.swift
//  yelp
//
//  Created by Andrew Folta on 9/18/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, YelpSearchResultsDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    @IBAction func onFilter() {
        println("SEARCH --onFilter")
    }

    @IBAction func onSearch() {
        println("SEARCH --onSearch --text \(searchBar.text)")
        yelpModel.startSearch()
        searchBar.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("SEARCH --viewDidLoad")
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        yelpModel.searchDelegate = self
    }

    override func viewWillAppear(animated: Bool) {
        println("SEARCH --viewWillAppear --pvc \(self.presentedViewController)")
    }

    override func viewDidAppear(animated: Bool) {
        println("SEARCH --viewDidAppear --pvc \(self.presentedViewController)")
    }

    func yelpSearchStarted() {
        println("SEARCH --searchStarted --pvc \(self.presentedViewController)")
//        self.window.rootViewController
    }

    func yelp(#searchResults: NSDictionary?, error: NSError?) {
        println("SEARCH --searchResults")
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        println("SEARCH --searchBar --searchButton --text \(searchBar.text)")
        yelpModel.startSearch()
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        println("SEARCH --searchBar --cancelButton --text \(searchBar.text)")
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as BusinessCell
        return cell
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }

//    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject!) {
//        println("SEARCH --segue --dest \(segue?.destinationViewController)")
//    }
}
