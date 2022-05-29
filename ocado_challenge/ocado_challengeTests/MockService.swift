//
//  MockService.swift
//  ocado_challengeTests
//
//  Created by MAC on 27/05/2022.
//

import Foundation

class MockService: ApiServiceProtocol {
    
    let mockClusters: [Cluster]?
    let mockProductDetail: ProductDetail?
    
    init(mockClusters: [Cluster]?) {
        self.mockClusters = mockClusters
        self.mockProductDetail = nil
    }
    init(mockProductDetail: ProductDetail?) {
        self.mockProductDetail = mockProductDetail
        self.mockClusters = nil
    }
    
    func fetchClusters(completion: @escaping ([Cluster]?) -> Void) {
        completion(mockClusters)
    }
    
    func fetchProductDetail(productId: Int, completion: @escaping (ProductDetail?) -> Void) {
        completion(mockProductDetail)
    }
}
