//
//  ToDoListView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 26/3/2022.
//

import SwiftUI

struct ToDoListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        ZStack {
            if listViewModel.itemList.isEmpty {
                NoItemsView()
            } else {
                List {
                    ForEach(listViewModel.itemList) {item in
                        HStack {
                            // the image for the checkmark
                            Image(systemName: item.isCompleted ? "checkmark.square" : "square")
                                .foregroundColor(item.isCompleted ? .green : .red)
                            NavigationLink("\(item.itemName)") {
                                itemDetailView(item: item)
                            }
                        }
                        // when tapped, call updateItem
                        .onTapGesture {
                            withAnimation(.linear) {
                                listViewModel.updateItem(item: item)
                            }
                        }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
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
        ToDoListView()
    }
}
