//
//  ItemListViewModel.swift
//  ViewModels
//
//  Created by Nguyen Quang Huy on 29/3/2022.
//

import Foundation
import SwiftUI

class ItemListViewModel: ObservableObject, Identifiable {
    
    // created a struct inside to generate a clone
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
    @Published private var data: Data
    
    @Published private var previous: Data
        
    var name: String {
        get {
            // when we get value from name, we instead got data.name
            data.name
        } set {
            // when we set value for name, the data.name got updated
            data.name = newValue
        }
    }
    
    var items: [ItemViewModel] {
        get {
            // what does this line return? do?
            data.items
        } set {
            // when ItemListViewModel gets called, set{} will also assign data.items with newValue
            data.items = newValue
        }
    }
    
    // init the data struct
    private init(data: Data) {
        self.data = data
        // data struct don't have var previous, so what does self.previous mean?
        self.previous = data.cloned
    }
    
    // convenience init the ItemListViewModel, convenience means that it will only init optional vars
    convenience init(name: String, items: [ItemViewModel]) {
        self.init(data: Data(name: name, items: items))
    }
    
//    // a func that makes a backup, why did we need this?
//    func backup() {
//        previous = data.cloned
//    }
    
    // Perform undo operation, not sure how this work but it does
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
