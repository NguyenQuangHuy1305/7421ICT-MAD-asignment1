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
        PersonViewModel(person: Person(firstName: "Huy", lastName: "Nguyen")),
        PersonViewModel(person: Person(firstName: "abc", lastName: "bcd")),
        PersonViewModel(person: Person(firstName: "cde", lastName: "def")),
    ]
    
    var body: some Scene {
        WindowGroup {
            ContentView(personList: viewModel)
        }
    }
}
