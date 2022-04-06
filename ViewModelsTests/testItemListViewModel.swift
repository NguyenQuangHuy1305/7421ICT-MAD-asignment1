//
//  testItemListViewModel.swift
//  ViewModelsTests
//
//  Created by Nguyen Quang Huy on 31/3/2022.
//

import XCTest
@testable import ViewModels

class testItemListViewModel: XCTestCase {
    
    func test_Init_ItemListViewModel () {
        let testItem1 = Item(name: "testItem1", isChecked: false)
        let testItem2 = Item(name: "testItem1", isChecked: false)

        let itemListViewModel = ItemListViewModel(name: "Todo List test",
                                                  items: [ItemViewModel(item: testItem1),
                                                          ItemViewModel(item: testItem2)])
        XCTAssertNotNil(itemListViewModel, "ItemListViewModel is not nil")
        XCTAssertEqual(itemListViewModel.name, "Todo List test")
    }
    
    func test_FuncResetItem_ItemListViewModel () {
        let testItem1 = Item(name: "testItem1", isChecked: true)
        let testItem2 = Item(name: "testItem1", isChecked: true)

        let itemListViewModel = ItemListViewModel(name: "Todo List test",
                                                  items: [ItemViewModel(item: testItem1),
                                                          ItemViewModel(item: testItem2)])
        itemListViewModel.resetItems()

        for i in 0..<(itemListViewModel.items.count) {
            XCTAssertEqual(itemListViewModel.items[i].item.isChecked, false)
        }
    }
    
    func test_FuncDeleteItem_ItemListViewModel () {
        let testItem1 = Item(name: "testItem1", isChecked: false)
        let testItem2 = Item(name: "testItem2", isChecked: false)
        let itemListViewModel = ItemListViewModel(name: "Todo List test",
                                                  items: [ItemViewModel(item: testItem1),
                                                          ItemViewModel(item: testItem2)])

        itemListViewModel.deleteItem(indexSet: [0])
        XCTAssertEqual(itemListViewModel.items.count, 1)
    }
    
    func test_FuncMoveItem_ItemListViewModel () {
        let testItem1 = Item(name: "testItem1", isChecked: false)
        let testItem2 = Item(name: "testItem2", isChecked: false)
        let itemListViewModel = ItemListViewModel(name: "Todo List test",
                                                  items: [ItemViewModel(item: testItem1),
                                                          ItemViewModel(item: testItem2)])

        itemListViewModel.moveItem(from: [1], to: 0)
        XCTAssertEqual(itemListViewModel.items[0].item.name, "testItem2")
    }
    
    func test_FuncAddItem_ItemListViewModel () {
        let testItem1 = Item(name: "testItem1", isChecked: false)
        let itemListViewModel = ItemListViewModel(name: "Todo List test",
                                                  items: [ItemViewModel(item: testItem1)])

        itemListViewModel.addItem(itemNameFieldText: "testItem2")
        XCTAssertEqual(itemListViewModel.items[1].item.name, "testItem2")
    }
    
    func test_FuncRenameTodoList_ItemListViewModel () {
        // 1st checklist
        let masterName = "master"
        let testItem1 = Item(name: "testItem1", isChecked: false)
        let testItem2 = Item(name: "testItem2", isChecked: false)
        let itemListViewModel1 = ItemListViewModel(name: "Checklist test1",
                                                  items: [ItemViewModel(item: testItem1),
                                                          ItemViewModel(item: testItem2)])

        // 2nd checklist
        let testItem3 = Item(name: "testItem3", isChecked: false)
        let testItem4 = Item(name: "testItem4", isChecked: false)
        let itemListViewModel2 = ItemListViewModel(name: "Checklist test2",
                                                  items: [ItemViewModel(item: testItem3),
                                                          ItemViewModel(item: testItem4)])

        // initialized TodoListViewModel
        let todoListViewModel = TodoListViewModel(name: masterName, lists: [itemListViewModel1,
                                                                       itemListViewModel2])

        itemListViewModel1.todolistName = "Renamed Todo List"
        
        itemListViewModel1.renameTodolist()

        XCTAssertEqual(todoListViewModel.lists[0].name, "Renamed Todo List")
    }
    
    func test_textAreAppropriate_ItemListViewModel () {
        let testItem1 = Item(name: "testItem1", isChecked: false)
        let testItem2 = Item(name: "testItem2", isChecked: false)
        let itemListViewModel = ItemListViewModel(name: "Todo List test",
                                                  items: [ItemViewModel(item: testItem1),
                                                          ItemViewModel(item: testItem2)])
        itemListViewModel.itemNameFieldText = ""
        XCTAssertEqual(itemListViewModel.textsAreAppropriate(), false)
        
        itemListViewModel.itemNameFieldText = "something"
        XCTAssertEqual(itemListViewModel.textsAreAppropriate(), true)
    }
    
}

//func textsAreAppropriate() -> Bool {
//    if itemNameFieldText.count == 0 {
//        alertTitle = "Item's name must not be blank"
//        showAlert.toggle()
//        return false
//    }
//    return true
//}
