//
//  TodoListViewModel.swift
//  ViewModels
//
//  Created by Nguyen Quang Huy on 29/3/2022.
//

import Foundation

class TodoListViewModel: ObservableObject {
    
    @Published var isLoaded: Bool = false
    
    /// this file exist only within the simulator
    let file: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("data.json", isDirectory: false)
    
    /// name of the "overall" lists, might as well be considered app name
    @Published var name: String
    
    /// a list of ItemLists
    @Published var lists: [ItemListViewModel]
        
    init(name: String, lists: [ItemListViewModel]) {
        self.name = name
        self.lists = lists
    }
        
    /// making the class codable
    enum CodingKeys: String, CodingKey {
        case name
        case lists
    }

    /// decodable conformance
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let lists = try container.decode([ItemListViewModel].self, forKey: .lists)
        self.init(name: name, lists: lists)
    }

    /// codable conformance
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.lists, forKey: .lists)
    }
    
    /// func to encrypt lists, then save that encrypted data to data.json
    /// - Parameter file: URL is where the file is saved in the simulator
    func save(toFile file: URL) {
        do {
            let data = try JSONEncoder().encode(lists)
            try data.write(to: file)
        } catch {
            fatalError("Unable to save")
        }
    }
    
    /// func to load data from data.json, then decrypt it into lists
    /// - Parameter file: URL is where the file is saved in the simulator
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
    
    /// func to delete an ItemList
    /// - Parameter indexSet: indexSet is a set of int generated according to where the user "swiped to delete"
    func deleteTodoList(indexSet: IndexSet) {
        lists.remove(atOffsets: indexSet)
    }
    
    /// func to move an ItemList
    /// - Parameters:
    ///   - from: from an IndexSet where the user swiped
    ///   - to: to a new location where the user stopped swiping
    func moveTodoList(from: IndexSet, to: Int) {
        lists.move(fromOffsets: from, toOffset: to)
    }
    
    /// func to add a new ItemList
    /// - Parameter todolistNameFieldText: field text for user to type the new name they want
    func addTodoList(todolistNameFieldText: String) {
        let newToDoList = ItemListViewModel(name: todolistNameFieldText, items: [])
        lists.append(newToDoList)
    }
}
