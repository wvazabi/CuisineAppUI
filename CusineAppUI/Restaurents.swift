//
//  Restaurents.swift
//  CusineAppUI
//
//  Created by Enes Kaya on 18.10.2023.
//

import Foundation

class Restaurents {
    

    
    var name : String
    var rate : Float
    var cuisine : String
    var image : String
    
     init(name: String, rate: Float, cuisine: String, image: String) {
        self.name = name
        self.rate = rate
        self.cuisine = cuisine
        self.image = image
    }
}
