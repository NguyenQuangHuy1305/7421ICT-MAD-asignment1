//
//  PersonViewModel.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 21/3/2022.
//

import Foundation

struct PersonViewModel: Identifiable {
    var person: Person
    var id: UUID{person.id}
    
    var fullName: String {
        person.firstName + " " + person.lastName
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
