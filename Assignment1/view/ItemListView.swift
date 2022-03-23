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
            ForEach(listViewModel.itemList) {itemViewModel in
                HStack {
                    Image(systemName: itemViewModel.item.isCompleted ? "checkmark.square" : "square")
                        .foregroundColor(itemViewModel.item.isCompleted ? .green : .red)
                    NavigationLink("\(itemViewModel.item.itemName)") {
                        itemDetailView(item: itemViewModel)
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
