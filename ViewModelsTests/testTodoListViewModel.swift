//
//  testTodoListViewModel.swift
//  ViewModelsTests
//
//  Created by Nguyen Quang Huy on 31/3/2022.
//

import XCTest
@testable import ViewModels

class testTodoListViewModel: XCTestCase {

    func test_Init_TodoListViewModel () {
        let testItem1 = Item(name: "testItem1", isChecked: false)
        let testItem2 = Item(name: "testItem2", isChecked: false)

        let itemListViewModel = ItemListViewModel(name: "Todo List test",
                                                  items: [ItemViewModel(item: testItem1),
                                                          ItemViewModel(item: testItem2)])
        
        let name = "checklist"
        
        let todoListViewModel = TodoListViewModel(name: name, lists: [itemListViewModel])
        XCTAssertNotNil(todoListViewModel, "ToDoListViewModel is not nil")
        XCTAssertEqual(todoListViewModel.name, "checklist")
    }
    
    func test_FuncAddTodoList_TodoListViewModel () {
        // 1st todoList
        let testItem1 = Item(name: "testItem1", isChecked: false)
        let testItem2 = Item(name: "testItem2", isChecked: false)
        let itemListViewModel = ItemListViewModel(name: "Test1",
                                                  items: [ItemViewModel(item: testItem1),
                                                          ItemViewModel(item: testItem2)])
        let name = "The checklist"
        let todoListViewModel = TodoListViewModel(name: name, lists: [itemListViewModel])

        // 2nd todoList added using addTodoList func
        todoListViewModel.addTodoList(todolistNameFieldText: "Todo List add func test")
        
        
        XCTAssertEqual(todoListViewModel.lists[1].name, "Todo List add func test")
    }
    
    func test_Func_DeleteTodoList_TodoListViewModel () {
        let testItem1 = Item(name: "testItem1", isChecked: false)
        let testItem2 = Item(name: "testItem2", isChecked: false)
        let itemListViewModel = ItemListViewModel(name: "Todo List test",
                                                  items: [ItemViewModel(item: testItem1),
                                                          ItemViewModel(item: testItem2)])
        let name = "checklist"
        let todoListViewModel = TodoListViewModel(name: name, lists: [itemListViewModel])

        todoListViewModel.deleteTodoList(indexSet: [0])

        XCTAssertEqual(todoListViewModel.lists.count, 0)
    }

    func test_Func_MoveTodoList_TodoListViewModel () {
        // 1st todoList
        let name1 = "checklist1"
        let testItem1 = Item(name: "testItem1", isChecked: false)
        let testItem2 = Item(name: "testItem2", isChecked: false)
        let itemListViewModel1 = ItemListViewModel(name: "Todo List test1",
                                                  items: [ItemViewModel(item: testItem1),
                                                          ItemViewModel(item: testItem2)])

        // 2nd todoList
        let testItem3 = Item(name: "testItem3", isChecked: false)
        let testItem4 = Item(name: "testItem4", isChecked: false)
        let itemListViewModel2 = ItemListViewModel(name: "Todo List test2",
                                                  items: [ItemViewModel(item: testItem3),
                                                          ItemViewModel(item: testItem4)])

        let todoListViewModel = TodoListViewModel(name: name1, lists: [itemListViewModel1,
                                                                       itemListViewModel2])

        todoListViewModel.moveTodoList(from: [1], to: 0)

        XCTAssertEqual(todoListViewModel.lists[0].name, "Todo List test2")
    }
    
    func test_Func_save_load_TodoListViewModel () {
        let file: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("data.json", isDirectory: false)
        
        // 1st list
        let name1 = "checklist1"
        let testItem1 = Item(name: "testItem1", isChecked: false)
        let testItem2 = Item(name: "testItem2", isChecked: false)
        let itemListViewModel1 = ItemListViewModel(name: "To do list save, load func test",
                                                  items: [ItemViewModel(item: testItem1),
                                                          ItemViewModel(item: testItem2)])
        // this is the test todoListViewModel
        let todoListViewModel = TodoListViewModel(name: name1, lists: [itemListViewModel1])

        todoListViewModel.save(toFile: file)
        
        todoListViewModel.load(fromFile: file)
        
        XCTAssertEqual(todoListViewModel.lists[0].name, "To do list save, load func test")
    }
}
