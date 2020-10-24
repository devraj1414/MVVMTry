//
//  MVVMTryTests.swift
//  MVVMTryTests
//
//  Created by Suruchi Kumari on 24/10/20.
//  Copyright © 2020 Suruchi Kumari. All rights reserved.
//

import XCTest
@testable import MVVMTry

class MVVMTryTests: XCTestCase {

    var sut : AlbumsViewModel!
    var mockService : MockService!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockService = MockService()
        sut = AlbumsViewModel(dataService: mockService!)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testFetchAlbumsinvoked(){
        sut?.fetchAlbums()
        
        XCTAssert(mockService.isAlbumsServiceInvoked, "Failed to invoke the Data Service")
        
        
    }
    
    func testMyTestable(){
        let album1 = Album(title: "Apple", artist: "India", thumbnail_image: "apple_India")
        let album2 = Album(title: "Apple", artist: "India", thumbnail_image: "apple_India")
        
        XCTAssertEqual(album1, album2)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
