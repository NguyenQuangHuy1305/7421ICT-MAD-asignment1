//
//  MasterView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 21/3/2022.
//

import Foundation
import SwiftUI

struct ItemListView: View {
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
                leading: EditButton(),
                trailing:
                    NavigationLink("[+]", destination: AddView())
                )
                .navigationTitle("Todo list")
            }
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemListView()
        }
        .environmentObject(ListViewModel())
    }
}
