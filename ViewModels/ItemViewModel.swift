//
//  ItemViewModel.swift
//  ViewModels
//
//  Created by Nguyen Quang Huy on 29/3/2022.
//

import Foundation
import SwiftUI

class ItemViewModel: ObservableObject, Identifiable {
    
    @Published var item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    func toggleChecked() {
        item.isChecked.toggle()
    }
    
    func uncheck() {
        item.isChecked = false
    }
}
