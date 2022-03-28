//
//  ToDoListViewModel.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 26/3/2022.
//

import Foundation
import SwiftUI

class ToDoListViewModel: ObservableObject {
    
    @Published var todoList: [ToDoList] = []
    
    init() {
        getToDoList()
    }

    func getToDoList() {
        let newToDoList = [
            ToDoList(todolistName: "todolist1",
                     todolistItems: [
                         Item(itemName: "John", isCompleted: true),
                         Item(itemName: "Wu", isCompleted: false),
                     ]),
             ToDoList(todolistName: "todolist2",
                      todolistItems: [
                          Item(itemName: "John", isCompleted: false),
                          Item(itemName: "Wu", isCompleted: true),
                          Item(itemName: "Huy", isCompleted: true)
                      ])
            ]
        todoList.append(contentsOf: newToDoList)
    }

    
    func deleteToDoList(indexSet: IndexSet) {
        todoList.remove(atOffsets: indexSet)
    }

    func moveToDoList(from: IndexSet, to: Int) {
        todoList.move(fromOffsets: from, toOffset: to)
    }

    func addToDoList(todolistNameFieldText: String) {
        let newToDoList = ToDoList(todolistName: todolistNameFieldText, todolistItems: [])
        todoList.append(newToDoList)
    }
}
