//
//  ToDoList.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 26/3/2022.
//

struct ToDoList: Identifiable {
    
    // 1st initializer, which will automatically generate id
    let id: String
    let todolistName: String
    let todolistItems: [Item] = []
}
