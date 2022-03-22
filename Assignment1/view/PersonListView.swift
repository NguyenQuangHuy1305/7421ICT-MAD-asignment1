//
//  MasterView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 21/3/2022.
//

import SwiftUI

struct PersonListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        List {
            ForEach(listViewModel.personList) {personViewModel in
                HStack {
                    Image(systemName: personViewModel.person.isCompleted ? "checkmark.square" : "square")
                        .foregroundColor(personViewModel.person.isCompleted ? .green : .red)
                    NavigationLink("\(personViewModel.person.firstName)") {
                        personDetailView(person: personViewModel)
                    }
                }
            }
            .onDelete(perform: listViewModel.deletePerson)
            .onMove(perform: listViewModel.movePerson)
        }
        .navigationBarItems(
        leading: EditButton(),
        trailing:
            NavigationLink("Add", destination: AddView())
        )
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PersonListView()
        }
        .environmentObject(ListViewModel())
    }
}
