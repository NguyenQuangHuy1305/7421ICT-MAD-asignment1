//
//  ListViewModel.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 23/3/2022.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var itemList: [ItemViewModel] = []
    
    init() {
        getPeople()
    }
    
    func getPeople() {
        let newPeople = [
            ItemViewModel(item: Item(itemName: "John", itemDesc: "Smith", isCompleted: true)),
            ItemViewModel(item: Item(itemName: "Wu", itemDesc: "Liuqi", isCompleted: true)),
            ItemViewModel(item: Item(itemName: "Huy", itemDesc: "Nguyen", isCompleted: true)),
            ItemViewModel(item: Item(itemName: "Johnny", itemDesc: "Sin", isCompleted: true)),
            ItemViewModel(item: Item(itemName: "Jack", itemDesc: "Sparrow", isCompleted: false)),
            ItemViewModel(item: Item(itemName: "a", itemDesc: "b", isCompleted: false)),
        ]
        itemList.append(contentsOf: newPeople)
    }
    
    func deletePerson(indexSet: IndexSet) {
        itemList.remove(atOffsets: indexSet)
    }
    
    func movePerson(from: IndexSet, to: Int) {
        itemList.move(fromOffsets: from, toOffset: to)
    }
}
