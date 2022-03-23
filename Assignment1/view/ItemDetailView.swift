//
//  personDetailView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 21/3/2022.
//

import SwiftUI

struct itemDetailView: View {
    var item: ItemViewModel
    
    var body: some View {
        VStack {
            Text("Item Description: \(item.itemDesc)")
        }
    }
}

struct itemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemListView()
        }
        .environmentObject(ListViewModel())
    }
}
