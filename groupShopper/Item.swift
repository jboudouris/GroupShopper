//
//  Item.swift
//  groupShopper
//
//  Created by James Boudouris on 6/10/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import Foundation

class Item {
    
    var name: String
    var price: Double = 0
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
    
}
