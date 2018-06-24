//
//  Group.swift
//  groupShopper
//
//  Created by James Boudouris on 6/24/18.
//  Copyright © 2018 discountShoppers. All rights reserved.
//

import Foundation

class Group {
    
    var name: String
    var members: [Person]
    
    init(name: String) {
        self.name = name
        self.members = [Person]()
    }
    
    func addPerson(person: Person) {
        members.append(person)
    }
    
    func removePerson(person: Person) {
        members = members.filter() { $0 !== person }
    }
}
