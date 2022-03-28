//
//  MasterView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 21/3/2022.
//

import Foundation
import SwiftUI

struct ItemListView: View {
    @EnvironmentObject var itemViewModel: ItemViewModel // why do I need this?
    @Binding var todolistItems: [Item] // binded to todolistItems from ToDoListView
    @State var todolistItemsBackUp: [Item]
    @State var itemNameFieldText: String = "" // initiate string as blank
    var todolistName: String

    var body: some View {
        ZStack {
            // temp view in case there's no item to show
            if todolistItems.isEmpty {
                List {
                    HStack {
                        TextField("New item name here", text: $itemNameFieldText)
                            .font(.subheadline)
                        Button(action: {
                            addItem(itemNameFieldText: itemNameFieldText)
                            itemNameFieldText = ""
                        }, label: {
                            Text("Add")
                        })
                    }
                }
                .navigationTitle("\(todolistName)")
            // main itemlistview where there're some items to show
            } else {
                List {
                    ForEach(todolistItems) {item in
                        HStack {
                            // the image for the checkmark
                            Image(systemName: item.isCompleted ? "checkmark.square" : "square")
                                .foregroundColor(item.isCompleted ? .green : .red)
                            Text("\(item.itemName)")
                        }
                        .onTapGesture {
                            withAnimation(.linear) {
                                updateItem(item: item)
                            }
                        }
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                    
                    HStack {
                        TextField("New item name here", text: $itemNameFieldText)
                            .font(.subheadline)
                        Button(action: {
                            addItem(itemNameFieldText: itemNameFieldText)
                            itemNameFieldText = ""
                        }, label: {
                            Text("Add")
                        })
                    }
                }
                .navigationBarItems(
                    // leading is the button on the left of the navigation bar
                    leading: EditButton(),
                    
                    // trailing is the button on the right of the navigation bar
                    trailing:
                        HStack {
                            // button to reset the itemlist back to it's "un-modified isCompleted" state
                            Button(action: {
                                for i in 0..<(todolistItems.count) {
                                    todolistItems[i] = todolistItemsBackUp[i]
                                }
                            }, label: {
                                Text("Undo")
                            })
                            
                            // button to untick all items
                            Button(action: {
                                // why do I have to do loop like this?
                                for i in 0..<(todolistItems.count) {
                                    todolistItems[i].isCompleted = false
                                }
                            }, label: {
                                Text("Reset")
                            })
                        }
                )
                .navigationTitle("\(todolistName)")
            }
        }
    }
    func deleteItem(indexSet: IndexSet) {
        todolistItems.remove(atOffsets: indexSet)
        todolistItemsBackUp.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        todolistItems.move(fromOffsets: from, toOffset: to)
        todolistItemsBackUp.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(itemNameFieldText: String) {
        let newItem = Item(itemName: itemNameFieldText, isCompleted: false)
        todolistItems.append(newItem)
        todolistItemsBackUp.append(newItem)
    }
    
    func updateItem(item: Item) {
        // this part get the 1st index of the item array which was passed in (from somewhere), however I'll only pass 1 item in, so the bow if will always be correct
        // the main point is to get the pressed item's index, so that I will know which item to update
        if let index = todolistItems.firstIndex (where: {$0.id == item.id}) {
            todolistItems[index] = item.updateComplete()
//            todolistItemsBackUp[index] = item.updateComplete() // don't need this line bcs updateComplete() modify the Item itself, which mean the  modified isCompleted should be loaded back to the ItemListView immediately
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
