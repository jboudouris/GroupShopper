//
//  Person.swift
//  groupShopper
//
//  Created by James Boudouris on 6/10/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import Foundation

class Person {
    
    var name: String
    var items: [Item] = []
    var total: Double  = 0
    
    init(name: String) {
        self.name = name
    }
    
    func addItem(item: Item) {
        items.append(item)
        item.assignPerson()
        //total = total + item.price
    }
    
    func removeItem(item: Item) {
        // test
        items = items.filter() { $0 !== item }
        //total = total - item.price
    }
    
    func hasItem(item_name: String) -> Bool {
        for item in self.items {
            if (item_name == item.name) {
                return true
            }
        }
        
        return false
    }
    
    // Loops through items and adds price/numPeople
    func calculateTotal() {
        for item in self.items {
            total = total + item.price / item.numPeople
        }
    }
}
