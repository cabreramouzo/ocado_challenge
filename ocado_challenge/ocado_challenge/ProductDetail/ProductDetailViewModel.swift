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
    
    let service: ApiServiceProtocol
    
    init(service: ApiServiceProtocol = ApiService()) {
        self.service = service
    }
    
    func getProductDetail(id: Int) {
        loading = true
        service.fetchProductDetail(productId: id, completion: { productDetail in
            guard let productDetail = productDetail else {
                self.loading = false
                return
            }
            
            self.productDetail = productDetail
            self.loading = false
            //print("CLUSTERS")
            //print(clusters, clusters.count)
        })
    }
}

