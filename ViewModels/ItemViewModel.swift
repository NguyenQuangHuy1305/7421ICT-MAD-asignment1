//
//  ItemViewModel.swift
//  ViewModels
//
//  Created by Nguyen Quang Huy on 29/3/2022.
//

import Foundation
import SwiftUI

class ItemViewModel: ObservableObject, Identifiable, Codable {
    
    @Published var item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    /// making the class codable
    enum CodingKeys: String, CodingKey {
        case item
    }

    /// decoder conformance
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let item = try container.decode(Item.self, forKey: .item)
        self.init(item: item)
    }

    /// encoder conformance
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(item, forKey: .item)
    }
    
    /// func to toggle (flip) the check status of an Item
    func toggleChecked() {
        item.isChecked.toggle()
    }
    
    /// func to uncheck an Item
    func uncheck() {
        item.isChecked = false
    }
}
