//
//  ListViewModel.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 23/3/2022.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var personList: [PersonViewModel] = []
    
    init() {
        getPeople()
    }
    
    func getPeople() {
        let newPeople = [
            PersonViewModel(person: Person(firstName: "John", lastName: "Smith", isCompleted: true)),
            PersonViewModel(person: Person(firstName: "Wu", lastName: "Liuqi", isCompleted: true)),
            PersonViewModel(person: Person(firstName: "Huy", lastName: "Nguyen", isCompleted: true)),
            PersonViewModel(person: Person(firstName: "Johnny", lastName: "Sin", isCompleted: true)),
            PersonViewModel(person: Person(firstName: "Jack", lastName: "Sparrow", isCompleted: false)),
            PersonViewModel(person: Person(firstName: "a", lastName: "b", isCompleted: false)),
        ]
        personList.append(contentsOf: newPeople)
    }
    
    func deletePerson(indexSet: IndexSet) {
        personList.remove(atOffsets: indexSet)
    }
    
    func movePerson(from: IndexSet, to: Int) {
        personList.move(fromOffsets: from, toOffset: to)
    }
}
