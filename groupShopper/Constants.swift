//
//  Constants.swift
//  groupShopper
//
//  Created by James Boudouris on 6/9/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import Foundation

var personList: [Person] = []

var itemList: [Item] = []

func savePeople(personList: [Person]) {
    UserDefaults.standard.set(personList, forKey: "personList")
}

func saveItems(itemList:[Item]) {
    UserDefaults.standard.set(itemList, forKey: "itemList")
}
