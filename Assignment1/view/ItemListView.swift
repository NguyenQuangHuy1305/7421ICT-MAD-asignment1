//
//  MasterView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 21/3/2022.
//

import Foundation
import SwiftUI

struct ItemListView: View {
    @EnvironmentObject var itemViewModel: ItemViewModel
    @State var todolistItems: [Item] // this thing might need to be observed object

    var body: some View {
        ZStack {
            if todolistItems.isEmpty {
                NoItemsView()
            } else {
                List {
                    ForEach(todolistItems) {item in
                        HStack {
                            // the image for the checkmark
                            Image(systemName: item.isCompleted ? "checkmark.square" : "square")
                                .foregroundColor(item.isCompleted ? .green : .red)
                            Text("\(item.itemName)")
                        }
                        // when tapped, call updateItem
//                        .onTapGesture {
//                            withAnimation(.linear) {
//                                listViewModel.updateItem(item: item)
//                            }
//                        }
                    }
//                    .onDelete(perform: listViewModel.deleteItem)
                    .onDelete(perform: {indexSet in
                        todolistItems.remove(atOffsets: indexSet)
                    })
//                    .onMove(perform: listViewModel.moveItem)
                }
                .navigationBarItems(
                    // leading is the button on the left of the navigation bar
                    leading: EditButton(),
                    // trailing is the button on the right of the navigation var
                    trailing:
                        NavigationLink("[+]", destination: AddView())
                )
                .navigationTitle("Item list")
            }
        }
    }
    
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ToDoListView()
        }
        .environmentObject(ItemViewModel())
    }
}
