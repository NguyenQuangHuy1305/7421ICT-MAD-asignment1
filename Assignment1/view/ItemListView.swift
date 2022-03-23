//
//  MasterView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 21/3/2022.
//

import SwiftUI

struct ItemListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        List {
            ForEach(listViewModel.itemList) {itemList in
                HStack {
                    Image(systemName: itemList.item.isCompleted ? "checkmark.square" : "square")
                        .foregroundColor(itemList.item.isCompleted ? .green : .red)
                    NavigationLink("\(itemList.item.itemName)") {
                        itemDetailView(item: itemList)
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
