//
//  ApiService.swift
//  ocado_challenge
//
//  Created by MAC on 27/05/2022.
//

import Foundation
import Combine

protocol ApiServiceProtocol {
    func fetchClusters(completion: @escaping ([Cluster]?) -> Void)
}

final class ApiService: ApiServiceProtocol {
    var subscribers = Set<AnyCancellable>()
    
    func fetchClusters(completion: @escaping ([Cluster]?) -> Void) {
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
                //print("responseee")
                //print(response)
                completion(response.clusters)
            })
            .store(in: &subscribers)
    }
}
