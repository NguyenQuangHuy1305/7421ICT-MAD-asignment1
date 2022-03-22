//
//  Assignment1App.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 15/3/2022.
//

import SwiftUI

@main
struct Assignment1App: App {
    var viewModel = [
        PersonViewModel(person: Person(firstName: "John", lastName: "Smith", isCompleted: true)),
        PersonViewModel(person: Person(firstName: "Wu", lastName: "Liuqi", isCompleted: true)),
        PersonViewModel(person: Person(firstName: "Huy", lastName: "Nguyen", isCompleted: true)),
        PersonViewModel(person: Person(firstName: "Johnny", lastName: "Sin", isCompleted: true)),
        PersonViewModel(person: Person(firstName: "Jack", lastName: "Sparrow", isCompleted: false)),
        PersonViewModel(person: Person(firstName: "a", lastName: "b", isCompleted: false)),
    ]
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                PersonListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
