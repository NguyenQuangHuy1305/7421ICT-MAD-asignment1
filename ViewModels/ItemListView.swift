//
//  ItemListView.swift
//  ViewModels
//
//  Created by Nguyen Quang Huy on 29/3/2022.
//

import SwiftUI
import Foundation

struct ItemListView: View {
    
    @ObservedObject var viewModel: ItemListViewModel
//    @Environment(\.editMode) var editMode

    var body: some View {
        NavigationLink(viewModel.name) {
            List {
                Section {
    //                if editMode?.wrappedValue.isEditing ?? true {
                        HStack {
                            TextField("New Todo list name here", text: $viewModel.todolistName)
                                .font(.subheadline)
                            Button("Rename", action: viewModel.renametodolist)
                        }
    //                }
                }
                
                Section {
                    // loop through a an array of items, each of them is an ItemViewModel
                    ForEach(viewModel.items) {item in
                        ItemView(viewModel: item)
                    }
                    .onDelete(perform: viewModel.deleteItem)
                    .onMove(perform: viewModel.moveItem)
                    
                    // add button, which add an Item to viewModel.items
                    HStack {
                        TextField("New item name here", text: $viewModel.itemName)
                            .font(.subheadline)
                        Button("Add", action: viewModel.addItem)
                    }
                }
            }
            .navigationBarItems(
                // leading is the button on the left of the navigation bar
                leading: EditButton(),
                // trailing is the button on the right of the navigation var
                trailing:
                HStack {
                    // button to reset the itemlist back to it's "un-modified isCompleted" state
                    Button("Undo", action: viewModel.restoreBackup)
                    // button to untick all items
                    Button("Reset", action: {
                        for i in 0..<(viewModel.items.count) {
                            viewModel.items[i].uncheck()
                        }
                    })
                }
            )
            .navigationTitle(viewModel.name)
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(
            viewModel: ItemListViewModel(
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
            )
        )
    }
}
