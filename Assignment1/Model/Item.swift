//
//  Person.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 21/3/2022.
//

import Foundation

struct Item: Identifiable {
    
    // 1st initializer, which will automatically generate id
    let id: String
    let itemName: String
    let itemDesc: String
    let isCompleted: Bool
    
    // 2nd initializer, which has the option to pas in an id: String, used when update items, since we've already got the current id
    init(id: String = UUID().uuidString, itemName: String, itemDesc: String, isCompleted: Bool) {
        self.id = id
        self.itemName = itemName
        self.itemDesc = itemDesc
        self.isCompleted = isCompleted
    }
    
    func updateComplete() -> Item {
        return Item(id: id, itemName: itemName, itemDesc: itemDesc, isCompleted: !isCompleted)
    }
}
