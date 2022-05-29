//
//  ProductListViewModel.swift
//  ocado_challenge
//
//  Created by MAC on 25/05/2022.
//

import SwiftUI
import Combine


final class ProductListViewModel: ObservableObject {
    @Published var clusters = [Cluster]()
    @Published var loading = true
    
    let apiURN = "/products"
    let service: ApiServiceProtocol
    init(service: ApiServiceProtocol = ApiService()) {
        self.service = service
    }
    
    func getClusters() {
        loading = true
        service.fetchData(uri: apiURN, model:ApiResult.self, completion: { data in
            self.loading = false
            guard let apiResult = data else {
                self.loading = false
                return
            }

            self.clusters = apiResult.clusters ?? []
        })
    }
}
