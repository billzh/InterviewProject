//
//  AdsListCellModelTest.swift
//  KijijiTestTests
//
//  Created by Biao Zhang on 2020-02-17.
//  Copyright © 2020 Biao Zhang. All rights reserved.
//

import XCTest
@testable import KijijiTest
class AdsListCellModelTest: XCTestCase {
    
    var viewModelOne: AdsListCellModel!
    var viewModelTwo: AdsListCellModel!
  
    override func setUp() {
        /// if type is nil should show "Unknow"
        let adOne = ADModel(id: 1, title: "First AD", price: "$ 2000.99", type: nil, imageUrl: "http://dummyimage.com/514x573.jpg/ff4444/ffffff")
        /// show type that get from remote
          let adTwo = ADModel(id: 2, title: "Last AD", price: "$ 398.99", type: "New", imageUrl: "No URL String")
        viewModelOne = AdsListCellModel(adOne)
        viewModelTwo = AdsListCellModel(adTwo)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testgetTitle() {
        let title = viewModelOne.getTitle()
        XCTAssertEqual(title, "First AD", "AD Title get from AdsListCellModel is wrong")
    }
    
    func testgetPrice() {
        let price = viewModelOne.getPrice()
        XCTAssertEqual(price, "$ 2000.99", "AD Price get from AdsListCellModel is wrong")
    }
    
    func testgetType() {
        let typeOne = viewModelOne.getType()
        XCTAssertEqual(typeOne, "Unknow", "Get wrong type from AdsListCellModel for original nil type")
        let typeTwo = viewModelTwo.getType()
        XCTAssertEqual(typeTwo, "New", "AD Type get from AdsListCellModel is wrong")
    }
    
    func testgetImageUrlString() {
        let urlString = viewModelOne.getImageUrlString()
        XCTAssertEqual(urlString, "https://dummyimage.com/514x573.jpg/ff4444/ffffff", "Image URL get from AdsListCellModel is wrong")
        let nonURLString = viewModelTwo.getImageUrlString()
        XCTAssertEqual(nonURLString, "No URL String", "Can not get correct invild url string from AdsListCellModel")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
