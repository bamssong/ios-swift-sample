//
//  TodoBamTests.swift
//  TodoBamTests
//
//  Created by dev.bamssong on 2015. 8. 26..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit
import XCTest

class TodoBamTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        var result = false
        
        var qeuryTodoManger = QeuryTodoManager()
        result = qeuryTodoManger.testCreateTodo()
        
        XCTAssert(result, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
