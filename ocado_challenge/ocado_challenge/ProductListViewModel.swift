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
    var subscribers = Set<AnyCancellable>()
    
    init() {
        URLSession.shared
            .dataTaskPublisher(for: urlProducts!)
            .map(\.data)
            .decode(type: ApiResult.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                if case .failure(let error) = $0 {
                    print("Error when leading \(error)")
                }
            }, receiveValue: { response in
                print(response)
                self.clusters = response.clusters
            })
            .store(in: &subscribers)
    }
}