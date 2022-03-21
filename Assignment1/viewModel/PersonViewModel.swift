//
//  PersonViewModel.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 21/3/2022.
//

import Foundation

struct PersonViewModel {
    var person: Person
    
    var fullName: String {
        person.firstName + " " + person.lastName
    }
}
