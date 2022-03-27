//
//  ToDoListView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 26/3/2022.
//

import Foundation
import SwiftUI

struct ToDoListView: View {
    @EnvironmentObject var todolistviewmodel: ToDoListViewModel

    var body: some View {
        ZStack {
            if todolistviewmodel.todoList.isEmpty {
                NoItemsView()
            } else {
                List {
                    ForEach(todolistviewmodel.todoList) {list in
                        NavigationLink("\(list.todolistName)") {
                            ItemListView(todolistItems: list.todolistItems)
                        }
                    }
                    .onDelete(perform: todolistviewmodel.deleteItem)
                    .onMove(perform: todolistviewmodel.moveItem)
                }
                .navigationBarItems(
                    // leading is the button on the left of the navigation bar
                    leading: EditButton(),
                    // trailing is the button on the right of the navigation var
                    trailing:
                        NavigationLink("[+]", destination: AddView())
                )
                .navigationTitle("Todo list")
            }
        }
    }
}


struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ToDoListView()
        }
    }
}
