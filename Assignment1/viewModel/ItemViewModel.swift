//
//  PersonViewModel.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 21/3/2022.
//

import Foundation

struct ItemViewModel: Identifiable {
    var item: Item
    var id: UUID{item.id}
    var itemDesc: String{item.itemDesc}
    
//    all logical modification on Item must be made here
    var fullName: String {
        item.itemName + " " + item.itemDesc
    }
}

//struct PersonListViewModel {
//
//    var items: [Person] = []
//
//    func addNewItem(item: Person) {
//        items.append(item)
//    }
//
//    func deleteItem(atIndex index: Int) {
//        items.remove(at: index)
//    }
//
//}
