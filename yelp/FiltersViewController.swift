//
//  FiltersViewController.swift
//  yelp
//
//  Created by Andrew Folta on 9/19/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        println("FILTERS --viewDidLoad")
    }

    override func viewWillAppear(animated: Bool) {
        println("FILTERS --viewWillAppear")
    }

    @IBAction func onCancel() {
        println("FILTERS --onCancel")
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onSearch() {
        println("FILTERS --onSearch")
        // TODO -- save new settings
        yelpModel.startSearch()
        dismissViewControllerAnimated(true, completion: nil)
    }


//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }

//    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject!) {
//        println("FILTERS --segue --dest \(segue?.destinationViewController)")
//    }
}
