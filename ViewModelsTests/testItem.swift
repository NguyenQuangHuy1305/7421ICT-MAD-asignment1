//
//  test1.swift
//  ViewModelsTests
//
//  Created by Nguyen Quang Huy on 30/3/2022.
//

import XCTest
@testable import ViewModels

class testItem: XCTestCase {

    // test item init
    func testItem() {
        let testItem = Item(name: "testItem", isChecked: false)
        XCTAssertEqual("testItem", testItem.name)
        XCTAssertEqual(false, testItem.isChecked)
    }    
}
