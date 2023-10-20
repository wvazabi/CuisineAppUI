//
//  RecentItem.swift
//  CusineAppUI
//
//  Created by Enes Kaya on 19.10.2023.
//

import Foundation

struct RecentItemModel {
    var itemName : String
    var itemRestaurant : String
    var itemImageName : String
    var itemRestaurantRating : Double
    var ratingCount : Int
    
    init(itemName: String, itemRestaurant: String, itemImageName: String, itemRestaurantRating: Double, ratingCount: Int) {
        self.itemName = itemName
        self.itemRestaurant = itemRestaurant
        self.itemImageName = itemImageName
        self.itemRestaurantRating = itemRestaurantRating
        self.ratingCount = ratingCount
    }
}
