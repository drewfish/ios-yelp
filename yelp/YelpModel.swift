//
//  YelpModel.swift
//  yelp
//
//  Created by Andrew Folta on 9/19/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import Foundation
import CoreLocation


struct YelpBusinessCategory {
    var id: String
    var name: String
    var children: [YelpBusinessCategory]    // for hierarchical mapping
}


struct YelpBusiness {
    var id: String
    var name: String
    var imageURL: NSURL             // image_url
    var ratingsImageURL: NSURL      // rating_img_url
    var reviews: Int                // review_count
    var location: NSDictionary      // location
//    var distance: Double            // distance
//    var categories: [YelpBusinessCategory]

    init(json: NSDictionary) {
        self.id = json["id"] as String
        self.name = json["name"] as String
        self.imageURL = NSURL(string: json["image_url"] as String)
        self.ratingsImageURL = NSURL(string: json["rating_img_url"] as String)
        self.reviews = json["review_count"] as Int
        self.location = json["location"] as NSDictionary
    }
}


struct YelpSearchSettings {
    var distance: Int       // meters
    var sortBy: Int         // 0=Best Matched, 1=Distance, 2=Highest Rated
    var haveDeals: Bool
    var categories: [YelpBusinessCategory]
}


protocol YelpSearchSettingsDelegate {
    func yelpSearchSettings(settings: YelpSearchSettings)
}


class YelpModel: BDBOAuth1RequestOperationManager, CLLocationManagerDelegate {
    let CONSUMER_KEY =      "yxVG9xnRiL8ZIRPbI70Irg"
    let CONSUMER_SECRET =   "EA71Q1CLdN-dOl-57Qd4b8eyKvQ"
    let TOKEN =             "rbNxBwQdQOyg8L8K8ZdFCjN-WPyV8LkA"
    let TOKEN_SECRET =      "SHqerU75fk50razhN0UqTm23QZE"
    let locationManager = CLLocationManager()
    var categories: [YelpBusinessCategory] = [
        YelpBusinessCategory(id: "active", name: "Active Life", children: []),
    ]

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        moreInit()
    }

    override init() {
        var baseURL = NSURL.URLWithString("http://api.yelp.com/v2/")
        super.init(baseURL: baseURL, consumerKey: CONSUMER_KEY, consumerSecret: CONSUMER_SECRET)
        var token = BDBOAuthToken(token: TOKEN, secret: TOKEN_SECRET, expiration: nil)
        self.requestSerializer.saveAccessToken(token)
        moreInit()
    }

    private func moreInit() {
        locationManager.delegate = self
//        locationManager.distanceFilter = kCLDistanceFilterNone
//        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.startMonitoringSignificantLocationChanges()
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println("------------------------------------------- LOCATION GOT")
        println(locations)
    }

    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("------------------------------------------- LOCATION ERROR")
        println(error)
    }

    func search(term: NSString, settings: YelpSearchSettings?, done: (businesses: [YelpBusiness], error: NSError?) -> Void) {
        var parameters = [
            "term": term,
            "location": "Kelseyville, CA"
        ]
println(locationManager.location)
//println("--latitude \(locationManager.location.coordinate.latitude) --longitude \(locationManager.location.coordinate.longitude)")
        self.GET("search",
            parameters: parameters,
            success: {
                (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                var list: [YelpBusiness] = []
println("-----------------------------------------------------")
                for jsonBusiness in (response["businesses"] as NSArray) {
//println(jsonBusiness)
                    var business = YelpBusiness(json: jsonBusiness as NSDictionary)
//println(business.location)
                    list.append(business)
                }
println("-----------------------------------------------------")
                done(businesses: list, error: nil)
            },
            failure: {
                (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                done(businesses: [], error: error)
            }
        )
    }
}

