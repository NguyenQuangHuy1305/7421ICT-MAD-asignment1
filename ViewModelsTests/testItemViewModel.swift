//
//  testItemViewModel.swift
//  ViewModelsTests
//
//  Created by Nguyen Quang Huy on 31/3/2022.
//

import XCTest
@testable import ViewModels

class testItemViewModel: XCTestCase {

    func testInitItemViewModel () {
        let testItem = Item(name: "testItem", isChecked: false)
        let itemViewModel = ItemViewModel(item: testItem)
        XCTAssertNotNil(itemViewModel, "ItemViewModel is not nil")
        XCTAssertEqual(itemViewModel.item.name, "testItem")
    }
    
    func testFuncToggleCheckedItemViewModel () {
        let testItem = Item(name: "testItem", isChecked: false)
        let itemViewModel = ItemViewModel(item: testItem)
        itemViewModel.toggleChecked()
        XCTAssertEqual(itemViewModel.item.isChecked, true)
    }
    
    func testFuncUnCheckItemViewModel () {
        let testItem = Item(name: "testItem", isChecked: false)
        let itemViewModel = ItemViewModel(item: testItem)
        itemViewModel.uncheck()
        XCTAssertEqual(itemViewModel.item.isChecked, false)
    }
}
