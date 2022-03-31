//
//  ContentView.swift
//  ViewModels
//
//  Created by Nguyen Quang Huy on 29/3/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = TodoListViewModel(
        name: "My List",
        lists: [
            ItemListViewModel(
                name: "Todo list 1",
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
            ),
            ItemListViewModel(
                name: "Todo list 2",
                items: [
                    ItemViewModel(
                        item: Item(
                            name: "Item 3",
                            isChecked: true
                        )
                    ),
                    ItemViewModel(
                        item: Item(
                            name: "Item 4",
                            isChecked: false
                        )
                    )
                ]
            )
        ]
    )
    
    var body: some View {
        TodoListView(viewModel: viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
