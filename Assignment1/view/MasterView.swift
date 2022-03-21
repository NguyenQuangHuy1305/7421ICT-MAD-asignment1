//
//  MasterView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 21/3/2022.
//

import SwiftUI

struct PersonListView: View {
    var personList: [PersonViewModel]
    
    var body: some View {
        List(personList) {
            personDetailView(person: $0)
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView(personList: [])
    }
}
