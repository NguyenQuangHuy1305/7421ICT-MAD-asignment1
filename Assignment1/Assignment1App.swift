//
//  Assignment1App.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 15/3/2022.
//

import SwiftUI

@main
struct Assignment1App: App {
    
    // make the todolistviewmodel into an environmentobject
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    @StateObject var todolistviewmodel: ToDoListViewModel = ToDoListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ToDoListView()
            }
            .environmentObject(listViewModel)
            .environmentObject(todolistviewmodel)
        }
    }
}
