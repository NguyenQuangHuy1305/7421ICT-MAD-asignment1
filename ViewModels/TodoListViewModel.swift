//
//  TodoListViewModel.swift
//  ViewModels
//
//  Created by Nguyen Quang Huy on 29/3/2022.
//

import Foundation

class TodoListViewModel: ObservableObject {
    
    @Published var isLoaded: Bool = false
    
    let file: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("data.json", isDirectory: false)
    
    @Published var name: String
    
    @Published var lists: [ItemListViewModel]
        
    init(name: String, lists: [ItemListViewModel]) {
        self.name = name
        self.lists = lists
    }
        
    // start of codable stuffs

    enum CodingKeys: String, CodingKey {
        case name
        case lists
    }

    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let lists = try container.decode([ItemListViewModel].self, forKey: .lists)
        self.init(name: name, lists: lists)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.lists, forKey: .lists)
    }

    func save(toFile file: URL) {
        do {
            let data = try JSONEncoder().encode(lists)
            try data.write(to: file)
        } catch {
            fatalError("Unable to save")
        }
    }
    
    func load(fromFile file: URL) {
        let decoder = JSONDecoder()
        guard
            let data = try? Data(contentsOf: file),
            let lists = try? decoder.decode([ItemListViewModel].self, from: data)
        else {
            isLoaded = true
            return
        }
        self.lists = lists
        isLoaded = true
    }

    // end of codable stuffs
    
    func deleteTodoList(indexSet: IndexSet) {
        lists.remove(atOffsets: indexSet)
    }

    func moveTodoList(from: IndexSet, to: Int) {
        lists.move(fromOffsets: from, toOffset: to)
    }

    func addTodoList(todolistNameFieldText: String) {
        let newToDoList = ItemListViewModel(name: todolistNameFieldText, items: [])
        lists.append(newToDoList)
    }
}
