//
//  TodoListView.swift
//  ViewModels
//
//  Created by Nguyen Quang Huy on 29/3/2022.
//

import SwiftUI
import Foundation

struct TodoListView: View {
    
    @ObservedObject var viewModel: TodoListViewModel
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(viewModel.lists) {todolist in
//                        NavigationLink("\(todolist.name)") {
                            ItemListView(viewModel: todolist)
//                        }
                    }
                    .onDelete(perform: viewModel.deleteTodoList)
                    .onMove(perform: viewModel.moveToDoList)
                }
                .navigationBarItems(
                    // leading is the button on the left of the navigation bar
                    leading: EditButton(),
                    // trailing is the button on the right of the navigation var
                    trailing:
                        NavigationLink("[+]", destination: AddTodoListView(viewModel: viewModel))
                )
                .navigationTitle("Checklists")
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(viewModel: TodoListViewModel(
            name: "My List",
            lists: [
                ItemListViewModel(
                    name: "Some List",
                    items: [
                        ItemViewModel(
                            item: Item(
                                name: "Item 1",
                                isChecked: false
                            )
                        ),
                        ItemViewModel(
                            item: Item(
                                name: "Item 2",
                                isChecked: true
                            )
                        )
                    ]
                ),
                ItemListViewModel(
                    name: "Some List2",
                    items: [
                        ItemViewModel(
                            item: Item(
                                name: "Item 3",
                                isChecked: false
                            )
                        ),
                        ItemViewModel(
                            item: Item(
                                name: "Item 4",
                                isChecked: true
                            )
                        )
                    ]
                )
            ]
        ))
    }
}
