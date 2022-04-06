//
//  TodoListViewModel.swift
//  ViewModels
//
//  Created by Nguyen Quang Huy on 29/3/2022.
//

import Foundation

class TodoListViewModel: ObservableObject {
    
    @Published var name: String
    
    @Published var lists: [ItemListViewModel]
        
    init(name: String, lists: [ItemListViewModel]) {
        self.name = name
        self.lists = lists
    }
    
    func deleteTodoList(indexSet: IndexSet) {
        lists.remove(atOffsets: indexSet)
//        let newToDoList = ItemListViewModel(name: "\(indexSet.endIndex)", items: [])
//        lists.append(newToDoList)
    }

    func moveTodoList(from: IndexSet, to: Int) {
        lists.move(fromOffsets: from, toOffset: to)
    }

    func addTodoList(todolistNameFieldText: String) {
        let newToDoList = ItemListViewModel(name: todolistNameFieldText, items: [])
        lists.append(newToDoList)
    }
}
