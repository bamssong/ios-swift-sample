//
//  ShoppingViewerFor11stTests.swift
//  ShoppingViewerFor11stTests
//
//  Created by dev.bamssong on 2015. 8. 26..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit
import XCTest

class ShoppingViewerFor11stTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
        
        var expectation = self.expectationWithDescription("GET")
        ProductManager.sharedManager.searchProduct(search: "아이폰") { (result, error) -> Void in
            if error == nil {
                let products = result["ProductSearchResponse","Products","Product"]
                for (key, product) in products {
                 
                    let productName = product["ProductName"].string
                    let ProductPrice = product["ProductPrice"].int
                    let ProductImage100 = product["ProductImage100"].string
                    let DetailPageUrl = product["DetailPageUrl"].string
                    println("\(product)")
                }
            }
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(10.0, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
