//
//  ItemView.swift
//  ViewModels
//
//  Created by Nguyen Quang Huy on 29/3/2022.
//

import SwiftUI

struct ItemView: View {
    
    @ObservedObject var viewModel: ItemViewModel
    
    var body: some View {
        HStack {
            // the image for the checkmark
            Image(systemName: viewModel.item.isChecked ? "checkmark.square" : "square")
                .foregroundColor(viewModel.item.isChecked ? .green : .red)
            Text(viewModel.item.name)
        }
        .onTapGesture {
            withAnimation(.linear) {
                viewModel.toggleChecked()
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(viewModel: ItemViewModel(item: Item(name: "Something", isChecked: false)))
    }
}
