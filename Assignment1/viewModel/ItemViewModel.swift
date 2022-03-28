//
//  ListViewModel.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 23/3/2022.
//

import Foundation
import SwiftUI

// this is the CRUD controller, is where I store the innit function to seed data, and CRUD funcs

class ItemViewModel: ObservableObject {
    
    @Published var itemList: [Item] = []
    
//    init() {
//        getPeople()
//    }
//
//    func getPeople() {
//        let newItem = [
//            Item(itemName: "John", isCompleted: true),
//            Item(itemName: "Wu", isCompleted: true),
//            Item(itemName: "Huy", isCompleted: true),
//        ]
//        itemList.append(contentsOf: newItem)
//    }
    
    func deleteItem(indexSet: IndexSet) {
        itemList.remove(atOffsets: indexSet)
    }
    
//    func moveItem(from: IndexSet, to: Int) {
//        itemList.move(fromOffsets: from, toOffset: to)
//    }
//
    func addItem(itemNameFieldText: String) {
        let newItem = Item(itemName: itemNameFieldText, isCompleted: false)
        itemList.append(newItem)
    }
//
//    func updateItem(item: Item) {
//        // this part get the 1st index of the item array which was passed in (from somewhere), however I'll only pass 1 item in, so the bow if will always be correct
//        // the main point is to get the pressed item's index, so that I will know which item to update
//        if let index = itemList.firstIndex (where: {$0.id == item.id}) {
//            itemList[index] = item.updateComplete()
//        }
//    }
}
