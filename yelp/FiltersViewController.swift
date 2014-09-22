//
//  FiltersViewController.swift
//  yelp
//
//  Created by Andrew Folta on 9/19/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit


class FiltersViewController: UIViewController {
    var delegate: YelpSearchSettingsDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        println("FILTERS --viewDidLoad --delegate \(delegate)")
    }

    override func viewWillAppear(animated: Bool) {
        println("FILTERS --viewWillAppear --delegate \(delegate)")
    }

    @IBAction func onCancel() {
        println("FILTERS --onCancel --delegate \(delegate)")
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onSearch() {
        println("FILTERS --onSearch --delegate \(delegate)")
        // TODO -- delegate!.yelpSearchSettings(settings: ...)
        dismissViewControllerAnimated(true, completion: nil)
    }


//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }

//    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject!) {
//        println("FILTERS --segue --dest \(segue?.destinationViewController)")
//    }
}
