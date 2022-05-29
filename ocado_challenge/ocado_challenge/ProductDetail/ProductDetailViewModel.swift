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
    
    let service: ApiServiceProtocol
    let URN = "/product"
    
    init(service: ApiServiceProtocol = ApiService()) {
        self.service = service
    }
    
    func getProductDetail(product id: Int) {
        loading = true
        service.fetchData(uri: URN + "/\(id)", model: ProductDetail.self, completion: { data in
            guard let productDetail = data else {
                self.loading = false
                return
            }
            
            self.productDetail = productDetail
            self.loading = false
        })
    }
}

