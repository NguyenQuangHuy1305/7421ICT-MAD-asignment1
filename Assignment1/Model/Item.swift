//
//  Person.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 21/3/2022.
//

import Foundation

struct Item: Identifiable {
    var id = UUID()
    var itemName: String
    var itemDesc: String
    var isCompleted: Bool
}
