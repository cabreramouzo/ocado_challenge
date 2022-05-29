//
//  MockService.swift
//  ocado_challengeTests
//
//  Created by MAC on 27/05/2022.
//

import Foundation

class MockService<T>: ApiServiceProtocol {
    
    let mockData: T?
    
    init(mockData: T?) {
        self.mockData = mockData
    }
    
    func fetchData<T>(uri: String, model: T.Type, completion: @escaping (T?) -> Void) where T : Decodable {
        
        completion(mockData as! T)
        
    }
    
}

//service.fetchData(uri: apiURN, model:ApiResult.self, completion: { data in
//    self.loading = false
//    guard let apiResult = data else {
//        self.loading = false
//        return
//    }
//
//    self.clusters = apiResult.clusters
//})
