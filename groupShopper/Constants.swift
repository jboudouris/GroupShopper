//
//  Constants.swift
//  groupShopper
//
//  Created by James Boudouris on 6/9/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import Foundation

// var personList: [Person] = []

var groupList: [Group] = []

var itemList: [Item] = []

func saveGroups(groupList: [Group]) {
    UserDefaults.standard.set(groupList, forKey: "groupList")
}

func saveItems(itemList:[Item]) {
    UserDefaults.standard.set(itemList, forKey: "itemList")
}
