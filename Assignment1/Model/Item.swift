//
//  Person.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 21/3/2022.
//

import Foundation

struct Item: Identifiable {
    
    let id: String
    let itemName: String
    let isCompleted: Bool
    
    // initializer, which has the option to either:
    //  - auto generate an id
    //  - receive an id: String, used when update items, since we've already got the current id
    init(id: String = UUID().uuidString, itemName: String, isCompleted: Bool) {
        self.id = id
        self.itemName = itemName
        self.isCompleted = isCompleted
    }
    
    // this fuction is used to flip the isCompleted of a given Item
    func updateComplete() -> Item {
        return Item(id: id, itemName: itemName, isCompleted: !isCompleted)
    }
}
