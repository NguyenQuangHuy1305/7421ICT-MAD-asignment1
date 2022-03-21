//
//  ContentView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 15/3/2022.
//

import SwiftUI

struct ContentView: View {
    var personList: [PersonViewModel]
    
    var body: some View {
        List(personList, id: \.fullName) {person in
            Text("Hello, \(person.fullName)!")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(personList: [PersonViewModel(person:
            Person(firstName: "Rene", lastName: "Hexel"))])
    }
}
