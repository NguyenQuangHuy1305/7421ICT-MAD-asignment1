//
//  MasterView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 21/3/2022.
//

import SwiftUI

struct PersonListView: View {
    @State var personList: [PersonViewModel]
//    @State private var checked = false

    var body: some View {
        List {
            ForEach(personList) {personViewModel in
                HStack {
                    Image(systemName: personViewModel.person.isCompleted ? "checkmark.square" : "square")
                        .foregroundColor(personViewModel.person.isCompleted ? .green : .red)
                    NavigationLink("\(personViewModel.person.firstName)") {
                        personDetailView(person: personViewModel)
                    }
                }
            }
            .onDelete(perform: deletePerson)
        }
        .navigationBarItems(
        leading: EditButton(),
        trailing:
            NavigationLink("Add", destination: AddView())
        )
    }
    
    func deletePerson(indexSet: IndexSet) {
        personList.remove(atOffsets: indexSet)
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(personList: [
            PersonViewModel(person: Person(firstName: "Rene", lastName: "Hexel", isCompleted: true)),
        ])
    }
}
