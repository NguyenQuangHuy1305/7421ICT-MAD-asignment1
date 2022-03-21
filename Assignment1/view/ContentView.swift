//
//  ContentView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 15/3/2022.
//

import SwiftUI

struct ContentView: View {
    var person: PersonViewModel
    
    var body: some View {
        Text("Hello, \(person.fullName)!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(person: PersonViewModel(person:
            Person(firstName: "Rene", lastName: "Hexel")))
    }
}
