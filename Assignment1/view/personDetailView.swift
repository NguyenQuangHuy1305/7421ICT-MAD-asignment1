//
//  personDetailView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 21/3/2022.
//

import SwiftUI

struct personDetailView: View {
    var person: PersonViewModel
    
    var body: some View {
        VStack {
            Text("ID: \(person.id)!")
        }
    }
}

struct personDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(personList: [
            PersonViewModel(person: Person(firstName: "Rene", lastName: "Hexel", isCompleted: true)),
        ])
    }
}
