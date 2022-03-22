//
//  MasterView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 21/3/2022.
//

import SwiftUI

struct PersonListView: View {
    var personList: [PersonViewModel]
//    @State private var checked = false

    var body: some View {
        List(personList) { personViewModel in
            HStack {
//                CheckBoxView(checked: $checked)
//                Spacer()
                Image(systemName: personViewModel.person.isCompleted ? "checkmark.square" : "square")
                    .foregroundColor(personViewModel.person.isCompleted ? .green : .red)
                NavigationLink("\(personViewModel.person.firstName)") {
                    personDetailView(person: personViewModel)
                }
            }
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(personList: [
            PersonViewModel(person: Person(firstName: "Rene", lastName: "Hexel", isCompleted: true)),
        ])
    }
}
