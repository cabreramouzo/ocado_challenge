//
//  ProductDetailViewModel.swift
//  ocado_challenge
//
//  Created by MAC on 26/05/2022.
//

import SwiftUI
import Combine

final class ProductDetailViewModel: ObservableObject {
    @Published var productDetail = ProductDetail(id: 1, price: "1", title: "", imageUrl: "", description: "", allergyInformation: "")
    @Published var productDetailImage = Image(systemName: "camera")
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
                //print(response)
                self.productDetail = response
            })
            .store(in: &subscribers)
    }
    
    func getProductDetailImage(imageUrl: String) {
        URLSession.shared
            .dataTaskPublisher(for: URL(string: imageUrl)!)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .compactMap { UIImage(data: $0) }
            .map { Image(uiImage: $0) }
            .replaceEmpty(with: Image(systemName: "camera"))
            .replaceError(with: Image(systemName: "camera"))
            .assign(to: \.productDetailImage, on: self)
            .store(in: &subscribers)
        
    }
}

