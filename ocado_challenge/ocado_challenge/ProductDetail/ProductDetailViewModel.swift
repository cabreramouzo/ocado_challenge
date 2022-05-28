//
//  ProductDetailViewModel.swift
//  ocado_challenge
//
//  Created by MAC on 26/05/2022.
//

import SwiftUI
import Combine

final class ProductDetailViewModel: ObservableObject {
    @Published var productDetail = ProductDetail(id: 123, price: "2.30", title: "Product Title", imageUrl: "", description: "Product description", allergyInformation: "No allergy info")
    @Published var loading = false
    var subscribers = Set<AnyCancellable>()
    
    func getProductDetail(id: Int) {
        loading = true
        URLSession.shared
            .dataTaskPublisher(for: getProductUrl(product: id))
            .map(\.data)
            .decode(type: ProductDetail.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                if case .failure(let error) = $0 {
                    print("Error when loading \(error)")
                }
            }, receiveValue: { response in
                //print(response)
                self.productDetail = response
                self.loading = false
            })
            .store(in: &subscribers)
    }
}

