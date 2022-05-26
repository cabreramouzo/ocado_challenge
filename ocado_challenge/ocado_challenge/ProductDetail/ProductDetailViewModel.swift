//
//  ProductDetailViewModel.swift
//  ocado_challenge
//
//  Created by MAC on 26/05/2022.
//

import Foundation
import Combine

final class ProductDetailViewModel: ObservableObject {
    @Published var productDetail = ProductDetail(id: 1, price: "1", title: "", imageUrl: "", description: "", allergyInformation: "")
    var subscribers = Set<AnyCancellable>()
    
    func getProductDetail(id: Int) {
        URLSession.shared
            .dataTaskPublisher(for: getProductUrl(product: id))
            .map(\.data)
            .decode(type: ProductDetail.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                if case .failure(let error) = $0 {
                    print("Error when leading \(error)")
                }
            }, receiveValue: { response in
                print("......")
                print(response)
                print("......")
                self.productDetail = response
            })
            .store(in: &subscribers)
    }
}

