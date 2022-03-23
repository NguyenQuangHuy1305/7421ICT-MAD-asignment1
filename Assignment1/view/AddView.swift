//
//  AddView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 23/3/2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var itemNameFieldText: String = ""
    @State var itemDescFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Item name here...", text: $itemNameFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                TextField("Item description here...", text: $itemDescFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
        }
        .padding(10.0)
        .navigationTitle("Add an item")
    }
    
    func saveButtonPressed() {
        listViewModel.addItem(itemNameFieldText: itemNameFieldText, itemDescFieldText: itemDescFieldText)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
