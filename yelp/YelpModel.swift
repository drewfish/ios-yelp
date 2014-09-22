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
    var imageURL: NSURL? = nil          // image_url
    var ratingsImageURL: NSURL? = nil   // rating_img_url
    var reviews: Int                    // review_count
    var location: NSDictionary          // location
    var distance: Double                // distance (meters)
    var categories: [YelpBusinessCategory] = []

    init(json: NSDictionary) {
        self.id = json["id"] as String
        self.name = json["name"] as String
        if let imageURL = json["image_url"] as? String {
            self.imageURL = NSURL(string: imageURL)
        }
        if let ratingsImageURL = json["rating_img_url"] as? String {
            self.ratingsImageURL = NSURL(string: ratingsImageURL)
        }
        self.reviews = json["review_count"] as? Int ?? 0
        self.location = json["location"] as? NSDictionary ?? [:]
        self.distance = (json["distance"] as? Double) ?? 0
        if let categories = json["categories"] as? NSArray {
            for category in categories {
                var id: String = category[1] as String
                var name: String = category[0] as String
                self.categories.append(YelpBusinessCategory(id: id, name: name, children: []))
            }
        }
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


class YelpModel: BDBOAuth1RequestOperationManager {
    let CONSUMER_KEY =      "yxVG9xnRiL8ZIRPbI70Irg"
    let CONSUMER_SECRET =   "EA71Q1CLdN-dOl-57Qd4b8eyKvQ"
    let TOKEN =             "rbNxBwQdQOyg8L8K8ZdFCjN-WPyV8LkA"
    let TOKEN_SECRET =      "SHqerU75fk50razhN0UqTm23QZE"

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init() {
        var baseURL = NSURL.URLWithString("http://api.yelp.com/v2/")
        super.init(baseURL: baseURL, consumerKey: CONSUMER_KEY, consumerSecret: CONSUMER_SECRET)
        var token = BDBOAuthToken(token: TOKEN, secret: TOKEN_SECRET, expiration: nil)
        self.requestSerializer.saveAccessToken(token)
    }

    func search(term: NSString, settings: YelpSearchSettings?, done: (businesses: [YelpBusiness], error: NSError?) -> Void) {
        // Much to my frustration, I couldn't get CLLocationManager to work :(
        var latitude = "37.734444"
        var longitude = "-122.431944"

        var parameters = [
            "term": term,
            "ll": "\(latitude),\(longitude)",
        ]
        var categories = ["restaurants"]
        if let gotSettings = settings {
            parameters["radius_filter"] = "\(gotSettings.distance)"
            parameters["sort"] = "\(gotSettings.sortBy)"
            if gotSettings.haveDeals {
                parameters["deals_filter"] = "true"
            }
            if gotSettings.categories.count > 0 {
                categories += gotSettings.categories.map({ $0.id })
            }
        }
        parameters["category_filter"] = NSArray(array: categories).componentsJoinedByString(",")
        self.GET("search",
            parameters: parameters,
            success: {
                (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                var list: [YelpBusiness] = []
                for jsonBusiness in (response["businesses"] as NSArray) {
                    list.append(YelpBusiness(json: jsonBusiness as NSDictionary))
                }
                done(businesses: list, error: nil)
            },
            failure: {
                (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                done(businesses: [], error: error)
            }
        )
    }
}

