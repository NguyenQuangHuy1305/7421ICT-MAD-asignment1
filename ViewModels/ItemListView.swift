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
    @Environment(\.editMode) var editMode

    var body: some View {
        
        if editMode?.wrappedValue == .active {
            HStack {
                TextField("New Todo list name here", text: $viewModel.todolistName)
                    .padding()
                    .font(.subheadline)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                Button("Rename", action: viewModel.renametodolist)
            }
            .padding(18)
        }
        
        List {
            // loop through a an array of items, each of them is an ItemViewModel
            ForEach(viewModel.items) {item in
                ItemView(viewModel: item)
            }
            .onDelete(perform: viewModel.deleteItem)
            .onMove(perform: viewModel.moveItem)
            
            // add button, which add an Item to viewModel.items
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
        
        if editMode?.wrappedValue == .active {
            HStack {
                TextField("New item name here", text: $viewModel.itemName)
                    .padding()
                    .font(.subheadline)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                Button("Add", action: viewModel.addItem)
            }
            .padding(18)
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
