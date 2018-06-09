//
//  Constants.swift
//  groupShopper
//
//  Created by James Boudouris on 6/9/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import Foundation

var personList = [String]()
var itemList = [String]()
var totals = [String]()

func savePeople(personList:[String]) {
    UserDefaults.standard.set(personList, forKey: "personList")
}

func saveItems(itemList:[String]) {
    UserDefaults.standard.set(itemList, forKey: "itemList")
}

