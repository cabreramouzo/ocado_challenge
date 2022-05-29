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
    var subscribers = Set<AnyCancellable>()
    
    let service: ApiServiceProtocol
    init(service: ApiServiceProtocol = ApiService()) {
        self.service = service
    }
    
    func fetchData() {
        loading = true
        service.fetchClusters(completion: { clusters in
            guard let clusters = clusters else {
                //print("No habia nada")
                self.loading = false
                return
            }
            
            self.clusters = clusters
            self.loading = false
            //print("CLUSTERS")
            //print(clusters, clusters.count)
        })
    }
}
