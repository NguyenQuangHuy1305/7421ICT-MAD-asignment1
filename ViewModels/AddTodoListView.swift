//
//  AddTodoListView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 29/3/2022.
//

import SwiftUI

/// when the user press the [+] button on the master view, the user will be directed to this view
struct AddTodoListView: View {
    
    /// need this to use presentationmode.wrappedvalue.dismiss(), which is the back button
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel: TodoListViewModel
    @State var todolistNameFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Todo List name here", text: $todolistNameFieldText)
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
        .navigationTitle("Add a new Todo List")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    /// func to detect when the save button is pressed, which then check if the field text are appropriate, if true then call the func addTodoList(), then back
    func saveButtonPressed() {
        if textsAreAppropriate() {
            viewModel.addTodoList(todolistNameFieldText: todolistNameFieldText)
            // this is the function to go back to itemListView after adding an item
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    /// func to check if the field text count !=0 or not
    /// - Returns: if count = 0, then return false, esle true
    func textsAreAppropriate() -> Bool {
        if todolistNameFieldText.count == 0 {
            alertTitle = "Todo List's name must not be blank"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    /// func to get the alert
    /// - Returns: return the alert text
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
//            AddTodoListView()
        }
    }
}
