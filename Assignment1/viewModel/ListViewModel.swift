//
//  ListViewModel.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 23/3/2022.
//

import Foundation
import SwiftUI

class ListViewModel: ObservableObject {
    
    @Published var itemList: [Item] = []
    
    init() {
        getPeople()
    }
    
    func getPeople() {
        let newItem = [
            Item(itemName: "John", itemDesc: "Smith", isCompleted: true),
            Item(itemName: "Wu", itemDesc: "Liuqi", isCompleted: true),
            Item(itemName: "Huy", itemDesc: "Nguyen", isCompleted: true),
            Item(itemName: "Johnny", itemDesc: "Sin", isCompleted: true),
            Item(itemName: "Jack", itemDesc: "Sparrow", isCompleted: false),
            Item(itemName: "a", itemDesc: "b", isCompleted: false),
        ]
        itemList.append(contentsOf: newItem)
    }
    
    func deleteItem(indexSet: IndexSet) {
        itemList.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        itemList.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(itemNameFieldText: String, itemDescFieldText: String) {
        let newItem = Item(itemName: itemNameFieldText, itemDesc: itemDescFieldText, isCompleted: false)
        itemList.append(newItem)
    }
    
    func updateItem(item: Item) {
        if let index = itemList.firstIndex (where: {$0.id == item.id}) {
            itemList[index] = Item(itemName: item.itemName, itemDesc: item.itemDesc, isCompleted: !item.isCompleted)
        }
    }
}
