//
//  ocado_challengeTests.swift
//  ocado_challengeTests
//
//  Created by MAC on 25/05/2022.
//

import XCTest
@testable import ocado_challenge

class ocado_challengeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSuccessFetchData() throws {
        
        let tag = "Fresh > Fruit > Bananas"
        let items = [
            Product(id: 1, price: "33", title: "Title Product 1", size: "big", imageUrl: ""),
            Product(id: 2, price: "12", title: "Title Product 2", size: "small", imageUrl: "")
        ]
        let expectedCluster = [Cluster(tag: tag, items: items)]
        
        let service = MockService(mockData: expectedCluster)
        
        let vm = ProductListViewModel(service: service)
        vm.fetchData()
        
        XCTAssertEqual(vm.clusters[0].items.count, 2)
    }
    
    func testEmptyData() {
        let expected = [Cluster]()
        let service = MockService(mockData: expected)
        
        let vm = ProductListViewModel(service: service)

        vm.fetchData()
        
        XCTAssertEqual(vm.clusters.count, 0)
    }
    
    func testNilData() {
        let expectedList: [Cluster]? = nil
        let service = MockService(mockData: expectedList)
        
        let vm = ProductListViewModel(service: service)
        vm.fetchData()
        
        XCTAssertEqual(vm.clusters.count, 0)
    }

}
