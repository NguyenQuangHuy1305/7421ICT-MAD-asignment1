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
        List {
            ForEach(listViewModel.itemList) {item in
                HStack {
                    Image(systemName: item.isCompleted ? "checkmark.square" : "square")
                        .foregroundColor(item.isCompleted ? .green : .red)
                    NavigationLink("\(item.itemName)") {
                        itemDetailView(item: item)
                    }
                }
                .onTapGesture {
                    withAnimation(.linear) {
                        
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
