//
//  YelpBusinessCategories.swift
//  yelp
//
//  Created by Andrew Folta on 9/21/14.
//  Copyright (c) 2014 Andrew Folta. All rights reserved.
//

import Foundation


var yelpBusinessCategories: [YelpBusinessCategory] = [
    YelpBusinessCategory(id: "afghani", name: "Afghan", children: []),
    YelpBusinessCategory(id: "african", name: "African", children: []),
    YelpBusinessCategory(id: "newamerican", name: "American (New)", children: []),
    YelpBusinessCategory(id: "tradamerican", name: "American (Traditional)", children: []),
//    YelpBusinessCategory(id: "argentine", name: "Argentine", children: []),
//    YelpBusinessCategory(id: "asianfusion", name: "Asian Fusion", children: []),
//    YelpBusinessCategory(id: "bbq", name: "Barbeque", children: []),
//    YelpBusinessCategory(id: "basque", name: "Basque", children: []),
//    YelpBusinessCategory(id: "belgian", name: "Belgian", children: []),
//    YelpBusinessCategory(id: "brasseries", name: "Brasseries", children: []),
//    YelpBusinessCategory(id: "brazilian", name: "Brazilian", children: []),
//    YelpBusinessCategory(id: "breakfast_brunch", name: "Breakfast & Brunch", children: []),
//    YelpBusinessCategory(id: "british", name: "British", children: []),
//    YelpBusinessCategory(id: "buffets", name: "Buffets", children: []),
//    YelpBusinessCategory(id: "burgers", name: "Burgers", children: []),
//    YelpBusinessCategory(id: "burmese", name: "Burmese", children: []),
//    YelpBusinessCategory(id: "cafes", name: "Cafes", children: []),
//    YelpBusinessCategory(id: "cajun", name: "Cajun/Creole", children: []),
//    YelpBusinessCategory(id: "cambodian", name: "Cambodian", children: []),
//    YelpBusinessCategory(id: "caribbean", name: "Caribbean", children: []),
//    YelpBusinessCategory(id: "cheesesteaks", name: "Cheesesteaks", children: []),
//    YelpBusinessCategory(id: "chicken_wings", name: "Chicken Wings", children: []),
//    YelpBusinessCategory(id: "chinese", name: "Chinese", children: []),
//    YelpBusinessCategory(id: "creperies", name: "Creperies", children: []),
//    YelpBusinessCategory(id: "cuban", name: "Cuban", children: []),
//    YelpBusinessCategory(id: "delis", name: "Delis", children: []),
//    YelpBusinessCategory(id: "diners", name: "Diners", children: []),
//    YelpBusinessCategory(id: "ethiopian", name: "Ethiopian", children: []),
//    YelpBusinessCategory(id: "hotdogs", name: "Fast Food", children: []),
//    YelpBusinessCategory(id: "filipino", name: "Filipino", children: []),
//    YelpBusinessCategory(id: "fishnchips", name: "Fish & Chips", children: []),
//    YelpBusinessCategory(id: "fondue", name: "Fondue", children: []),
//    YelpBusinessCategory(id: "foodstands", name: "Food Stands", children: []),
//    YelpBusinessCategory(id: "french", name: "French", children: []),
//    YelpBusinessCategory(id: "gastropubs", name: "Gastropubs", children: []),
//    YelpBusinessCategory(id: "german", name: "German", children: []),
//    YelpBusinessCategory(id: "gluten_free", name: "Gluten-Free", children: []),
//    YelpBusinessCategory(id: "greek", name: "Greek", children: []),
//    YelpBusinessCategory(id: "halal", name: "Halal", children: []),
//    YelpBusinessCategory(id: "hawaiian", name: "Hawaiian", children: []),
//    YelpBusinessCategory(id: "himalayan", name: "Himalayan/Nepalese", children: []),
//    YelpBusinessCategory(id: "hotdog", name: "Hot Dogs", children: []),
//    YelpBusinessCategory(id: "hungarian", name: "Hungarian", children: []),
//    YelpBusinessCategory(id: "indpak", name: "Indian", children: []),
//    YelpBusinessCategory(id: "indonesian", name: "Indonesian", children: []),
//    YelpBusinessCategory(id: "irish", name: "Irish", children: []),
//    YelpBusinessCategory(id: "italian", name: "Italian", children: []),
//    YelpBusinessCategory(id: "japanese", name: "Japanese", children: []),
//    YelpBusinessCategory(id: "korean", name: "Korean", children: []),
//    YelpBusinessCategory(id: "kosher", name: "Kosher", children: []),
//    YelpBusinessCategory(id: "latin", name: "Latin American", children: []),
//    YelpBusinessCategory(id: "raw_food", name: "Live/Raw Food", children: []),
//    YelpBusinessCategory(id: "malaysian", name: "Malaysian", children: []),
//    YelpBusinessCategory(id: "mediterranean", name: "Mediterranean", children: []),
//    YelpBusinessCategory(id: "mexican", name: "Mexican", children: []),
//    YelpBusinessCategory(id: "mideastern", name: "Middle Eastern", children: []),
//    YelpBusinessCategory(id: "modern_european", name: "Modern European", children: []),
    YelpBusinessCategory(id: "mongolian", name: "Mongolian", children: []),
    YelpBusinessCategory(id: "moroccan", name: "Moroccan", children: []),
    YelpBusinessCategory(id: "pakistani", name: "Pakistani", children: []),
    YelpBusinessCategory(id: "persian", name: "Persian/Iranian", children: []),
    YelpBusinessCategory(id: "peruvian", name: "Peruvian", children: []),
    YelpBusinessCategory(id: "pizza", name: "Pizza", children: []),
    YelpBusinessCategory(id: "polish", name: "Polish", children: []),
    YelpBusinessCategory(id: "portuguese", name: "Portuguese", children: []),
    YelpBusinessCategory(id: "russian", name: "Russian", children: []),
    YelpBusinessCategory(id: "salad", name: "Salad", children: []),
    YelpBusinessCategory(id: "sandwiches", name: "Sandwiches", children: []),
    YelpBusinessCategory(id: "scandinavian", name: "Scandinavian", children: []),
//    YelpBusinessCategory(id: "seafood", name: "Seafood", children: []),
//    YelpBusinessCategory(id: "singaporean", name: "Singaporean", children: []),
//    YelpBusinessCategory(id: "soulfood", name: "Soul Food", children: []),
//    YelpBusinessCategory(id: "soup", name: "Soup", children: []),
//    YelpBusinessCategory(id: "southern", name: "Southern", children: []),
//    YelpBusinessCategory(id: "spanish", name: "Spanish", children: []),
//    YelpBusinessCategory(id: "steak", name: "Steakhouses", children: []),
//    YelpBusinessCategory(id: "sushi", name: "Sushi Bars", children: []),
//    YelpBusinessCategory(id: "taiwanese", name: "Taiwanese", children: []),
//    YelpBusinessCategory(id: "tapas", name: "Tapas Bars", children: []),
//    YelpBusinessCategory(id: "tapasmallplates", name: "Tapas/Small Plates", children: []),
//    YelpBusinessCategory(id: "tex-mex", name: "Tex-Mex", children: []),
    YelpBusinessCategory(id: "thai", name: "Thai", children: []),
    YelpBusinessCategory(id: "turkish", name: "Turkish", children: []),
    YelpBusinessCategory(id: "ukrainian", name: "Ukrainian", children: []),
    YelpBusinessCategory(id: "vegan", name: "Vegan", children: []),
    YelpBusinessCategory(id: "vegetarian", name: "Vegetarian", children: []),
    YelpBusinessCategory(id: "vietnamese", name: "Vietnamese", children: []),
]


extension YelpModel {
    var categories: [YelpBusinessCategory] {
        return yelpBusinessCategories
    }
}

