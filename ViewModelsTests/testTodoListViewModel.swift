//
//  testTodoListViewModel.swift
//  ViewModelsTests
//
//  Created by Nguyen Quang Huy on 31/3/2022.
//

import XCTest
@testable import ViewModels

class testTodoListViewModel: XCTestCase {

    func testInitTodoListViewModel () {
        let testItem1 = Item(name: "testItem1", isChecked: false)
        let testItem2 = Item(name: "testItem1", isChecked: false)

        let itemListViewModel = ItemListViewModel(name: "Todo List test",
                                                  items: [ItemViewModel(item: testItem1),
                                                          ItemViewModel(item: testItem2)])
        
        let name = "checklist"
        
        let todoListViewModel = TodoListViewModel(name: name, lists: [itemListViewModel])
        XCTAssertNotNil(todoListViewModel, "ToDoListViewModel is not nil")
        XCTAssertEqual(todoListViewModel.name, "checklist")
    }
}
