//
//  CategoryCellViewModelTests.swift
//  KijijiTestTests
//
//  Created by Biao Zhang on 2020-02-17.
//  Copyright © 2020 Biao Zhang. All rights reserved.
//

import XCTest
@testable import KijijiTest

class CategoryCellViewModelTests: XCTestCase {
    
    
    var viewModel: CategoryCellViewModel!
    override func setUp() {
        super.setUp()
        let category = ADCategory(id: 1, name: "First Category", count: 12)
        viewModel = CategoryCellViewModel(category: category)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testgetCategoryID(){
        let cateID = viewModel.getCategoryID()
        XCTAssertEqual(cateID, "1", "Category ID get from CategoryCellViewModel is wrong")
    }
    
    func testgetCategoryName() {
        let name = viewModel.getCategoryName()
        XCTAssertEqual(name, "First Category", "Category Name get from CategoryCellViewModel is wrong")
    }
    
    func testgetCategoryCountString() {
        let count = viewModel.getCategoryCountString()
        XCTAssertEqual(count, "12", "Category Count get from CategoryCellViewModel is wrong")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
