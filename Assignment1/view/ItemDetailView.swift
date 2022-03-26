//
//  personDetailView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 21/3/2022.
//

import SwiftUI

struct itemDetailView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    var item: Item
    
    var body: some View {
        ScrollView {
            VStack {
//                Text("Item Description: \(item.itemDesc)")
            }
            // 
            Button(action: itemDetailViewTest, label: {
                Text("smthng".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            })
        }
        .padding(10)
    }
    
    func itemDetailViewTest() {
        // this func doesn't do anything atm
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
