//
//  Constants.swift
//  groupShopper
//
//  Created by James Boudouris on 6/9/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import Foundation

// var personList: [Person] = []

var groupList: [Group] = [] // list of Person types

var itemList: [Item] = []

var currentGroup = 0 // TODO: check correct type

func saveGroups(groupList: [Group]) {
    UserDefaults.standard.set(groupList, forKey: "groupList")
}

func saveItems(itemList:[Item]) {
    UserDefaults.standard.set(itemList, forKey: "itemList")
}


