//
//  ToDoList.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 26/3/2022.
//

import Foundation

struct ToDoList: Identifiable {
        
    let id: String
    let todolistName: String
    var todolistItems: [Item] = []
    
    init(id: String = UUID().uuidString, todolistName: String, todolistItems: [Item]) {
        self.id = id
        self.todolistName = todolistName
        self.todolistItems = todolistItems
    }
}
