//
//  BusinessCell.swift
//  yelp
//
//  Created by Andrew Folta on 9/19/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import UIKit


class BusinessCell: UITableViewCell {
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingsImage: UIImageView!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    let distanceFormatter = NSNumberFormatter()

    func formatFromBusiness(index: Int, business: YelpBusiness) {
        if business.imageURL != nil {
            thumbImage.setImageWithURL(business.imageURL!)
            thumbImage.layer.cornerRadius = 8.0
            thumbImage.layer.masksToBounds = true
        }
        if business.ratingsImageURL != nil {
            ratingsImage.setImageWithURL(business.ratingsImageURL!)
        }
        nameLabel.text = "\(index + 1). \(business.name)"
        reviewsLabel.text = "\(business.reviews) Reviews"

        // FUTURE -- most inefficient to configure formatter for every cell :(
        distanceFormatter.numberStyle = .DecimalStyle
        distanceFormatter.maximumFractionDigits = 2
        distanceFormatter.roundingMode = .RoundUp
        var distance = business.distance * 0.000621371
        distanceLabel.text = "\(distanceFormatter.stringFromNumber(distance)) mi"

        var address = business.location["display_address"] as [String]
        if business.distance < 10000 {
            address.removeLast()
        }
        locationLabel.text = NSArray(array: address).componentsJoinedByString(", ")

        categoriesLabel.text = NSArray(array: business.categories.map({ $0.name })).componentsJoinedByString(", ")
    }

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        // Configure the view for the selected state
//    }
}
