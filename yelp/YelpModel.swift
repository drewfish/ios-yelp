//
//  YelpModel.swift
//  yelp
//
//  Created by Andrew Folta on 9/19/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import Foundation


protocol YelpSearchResultsDelegate {
    func yelpSearchStarted()
    func yelp(#searchResults: NSDictionary?, error: NSError?)
}


class YelpModel {

    var searchDelegate: YelpSearchResultsDelegate?

    init() {
        // nothing to do, but init() is required for some reason
    }

    // initiates a search. results are returned to the delegate
    func startSearch() {
        if let delegate = searchDelegate {
            delegate.yelpSearchStarted()
            delegate.yelp(searchResults: nil, error: nil)
        }
    }

}

