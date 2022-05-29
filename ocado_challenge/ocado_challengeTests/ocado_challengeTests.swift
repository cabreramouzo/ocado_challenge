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
        
        let service = MockService(mockClusters: expectedCluster)
        
        let vm = ProductListViewModel(service: service)
        vm.fetchData()
        
        XCTAssertEqual(vm.clusters[0].items.count, 2)
    }
    
    func testEmptyData() {
        let expected = [Cluster]()
        let service = MockService(mockClusters: expected)
        
        let vm = ProductListViewModel(service: service)

        vm.fetchData()
        
        XCTAssertEqual(vm.clusters.count, 0)
    }
    
    func testNilData() {
        let expectedList: [Cluster]? = nil
        let service = MockService(mockClusters: expectedList)
        
        let vm = ProductListViewModel(service: service)
        vm.fetchData()
        
        XCTAssertEqual(vm.clusters.count, 0)
    }
    
    func testSuccessFetchDataDetail() throws {
        
        let expectedProductDetail = ProductDetail(id: 1, price: "22", title: "Prodcut 1", imageUrl: "", description: "description", allergyInformation: "None")
        
        let service = MockService(mockProductDetail: expectedProductDetail)
        
        let vm = ProductDetailViewModel(service: service)
        vm.getProductDetail(id: expectedProductDetail.id)
        
        XCTAssertEqual(vm.productDetail, expectedProductDetail)
    }

}
