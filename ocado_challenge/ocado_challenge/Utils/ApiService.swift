//
//  ApiService.swift
//  ocado_challenge
//
//  Created by MAC on 27/05/2022.
//

import Foundation
import Combine

protocol ApiServiceProtocol {
    func fetchData<T:Decodable>(uri: String, model: T.Type, completion: @escaping (T?) -> Void)
}

final class ApiService: ApiServiceProtocol {
    let baseURL = "https://my-json-server.typicode.com/ocadotechnology/mobile-challenge"
    // MARK: We need to make sure that subcribers is defined
    var subscribers = Set<AnyCancellable>()
    
    func fetchData<T: Decodable>(uri: String, model: T.Type, completion: @escaping (T?) -> Void) {
        let endpoint = uri.first != "/" ? "/" + uri : uri
        let url = URL(string: baseURL + endpoint)!

        URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: model.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                if case .failure(let error) = $0 {
                    print("Error when leading \(error)")
                }
                
            }, receiveValue: { response in
                completion(response)
            })
            .store(in: &subscribers)
    }
}
