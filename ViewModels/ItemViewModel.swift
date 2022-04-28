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
    
    //

    enum CodingKeys: String, CodingKey {
        case item
    }

    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let item = try container.decode(Item.self, forKey: .item)
        self.init(item: item)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(item, forKey: .item)
    }

    //
    
    func toggleChecked() {
        item.isChecked.toggle()
    }
    
    func uncheck() {
        item.isChecked = false
    }
}
