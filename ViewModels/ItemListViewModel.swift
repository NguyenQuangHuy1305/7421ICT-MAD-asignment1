//
//  ItemListViewModel.swift
//  ViewModels
//
//  Created by Nguyen Quang Huy on 29/3/2022.
//

import Foundation
import SwiftUI

class ItemListViewModel: ObservableObject, Identifiable, Codable {
    
    let file: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("data.json", isDirectory: false)
    
    // created a struct to generate a clone
    private struct Data {
        var name: String
        var items: [ItemViewModel]
        
        // there will be a clone of itself for "restoreBackUp" purposes
        var cloned: Data {
            Data(name: name, items: items.map { ItemViewModel(item: $0.item) }) // need explaining on this line
        }
    }
    
    // this line is for the addItem func only
    @Published var itemNameFieldText: String = ""
    // this line is for the todolistrename func only
    @Published var todolistName: String = ""
    
    @Published var alertTitle: String = ""
    @Published var showAlert: Bool = false
    
    // how does @Published and private even work together?
    @Published private var data: Data // because data is published, data.name and data.items from line 39 and 42 is published aswel (need confirmation)
    @Published private var previous: Data
        
    var name: String {
        get {
            // when we get value from the var name, we instead got data.name
            data.name
        } set {
            // when we set value for name, the data.name got updated
            data.name = newValue
        }
    }
    
    var items: [ItemViewModel] {
        get {
            data.items
        } set {
            data.items = newValue
        }
    }
    
    // init for the data struct
    private init(data: Data) {
        self.data = data
        self.previous = data.cloned
    }
    
    // convenience init the ItemListViewModel, convenience means that it will only init optional vars
    convenience init(name: String, items: [ItemViewModel]) {
        self.init(data: Data(name: name, items: items))
//        self.name = name
//        self.items = items
    }
    
    ///

    enum CodingKeys: String, CodingKey {
        case name
        case items
    }
    
    // decodable conformance
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let items = try container.decode([ItemViewModel].self, forKey: .items)
        self.init(name: name, items: items)
    }

    // codable conformance
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.items, forKey: .items)
    }

    ///
    
    // Perform undo operation
    func restoreBackup() {
        data = previous
        previous = data.cloned
    }
    
    func resetItems() {
        for item in items {
            item.uncheck()
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
//        TodoListViewModel(toFile: file)
    }

    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }

    func addItem(itemNameFieldText: String) {
        let newItem = ItemViewModel(item: Item(name: itemNameFieldText, isChecked: false))
        items.append(newItem)
        self.itemNameFieldText = ""
    }
    
    func renameTodolist() {
        data.name = todolistName
        todolistName = ""
    }
    
    func addButtonPressed() {
        if textsAreAppropriate() {
            addItem(itemNameFieldText: itemNameFieldText)
        }
    }
    
    func textsAreAppropriate() -> Bool {
        if itemNameFieldText.count == 0 {
            alertTitle = "Item's name must not be blank"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
//
//    func updateItem(item: Item) {
//        // this part get the 1st index of the item array which was passed in (from somewhere), however I'll only pass 1 item in, so the bow if will always be correct
//        // the main point is to get the pressed item's index, so that I will know which item to update
//        if let index = todolistItems.firstIndex (where: {$0.id == item.id}) {
//            todolistItems[index] = item.updateComplete()
////            todolistItemsBackUp[index] = item.updateComplete() // don't need this line bcs updateComplete() modify the Item itself, which mean the  modified isCompleted should be loaded back to the ItemListView immediately
//        }
//    }
}
