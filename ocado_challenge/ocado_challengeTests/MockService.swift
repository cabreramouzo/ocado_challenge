//
//  MockService.swift
//  ocado_challengeTests
//
//  Created by MAC on 27/05/2022.
//

import Foundation

class MockService: ApiServiceProtocol {
    
    let mockData: [Cluster]?
    
    init(mockData: [Cluster]?) {
        self.mockData = mockData
    }
    
    func fetchClusters(completion: @escaping ([Cluster]?) -> Void) {
        completion(mockData)
    }
}
