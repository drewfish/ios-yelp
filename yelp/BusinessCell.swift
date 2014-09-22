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

    func formatFromBusiness(index: Int, business: YelpBusiness) {
        ratingsImage.setImageWithURL(business.ratingsImageURL)
        thumbImage.setImageWithURL(business.imageURL)
        nameLabel.text = "\(index + 1). \(business.name)"
//        distanceLabel.text = "\(business.distance)"        // TODO -- convert to miles
        reviewsLabel.text = "\(business.reviews) Reviews"
//        locationLabel.text = business.location
        // TODO -- categoriesLabel
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
