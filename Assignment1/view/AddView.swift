//
//  AddView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 23/3/2022.
//

import SwiftUI

struct AddView: View {
    
    // need this to use presentationmode.wrappedvalue.dismiss(), which is the back button
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var itemNameFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Item name here...", text: $itemNameFieldText)
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
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textsAreAppropriate() {
            listViewModel.addItem(itemNameFieldText: itemNameFieldText)
            // this is the function to go back to itemListView after adding an item
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textsAreAppropriate() -> Bool {
        if itemNameFieldText.count == 0 {
            alertTitle = "Item name must not be blank"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
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
