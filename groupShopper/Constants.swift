//
//  Constants.swift
//  groupShopper
//
//  Created by James Boudouris on 6/9/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import Foundation

var todoList: [String]?

func saveData(todoList:[String]) {
    UserDefaults.standard.set(todoList, forKey: "todoList")
}

func fetchData() -> [String]? {
    if let todo = UserDefaults.standard.array(forKey: "todoList") as? [String] {
        return todo
    } else {
        return nil
    }
}
