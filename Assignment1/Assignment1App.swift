//
//  Assignment1App.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 15/3/2022.
//

import SwiftUI

@main
struct Assignment1App: App {
    var viewModel = PersonViewModel(person: Person(firstName: "Huy", lastName: "quang"))
    var body: some Scene {
        WindowGroup {
            ContentView(person: viewModel)
        }
    }
}
