//
//  SearchResultsViewController.swift
//  yelp
//
//  Created by Andrew Folta on 9/18/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func onFilter(sender: AnyObject) {
        println("--filter")
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        println("--searchBar --searchButton --text \(searchBar.text)")
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        println("--searchBar --cancelButton --text \(searchBar.text)")
    }

    @IBAction func onFilter() {
        println("--filter")
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

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//    }


}
