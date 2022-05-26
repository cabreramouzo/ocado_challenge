//
//  ProductDetailView.swift
//  ocado_challenge
//
//  Created by MAC on 26/05/2022.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject var productDetailVM = ProductDetailViewModel()
    let productId: Int
    var body: some View {
        Text(productDetailVM.productDetail.title)
            .onAppear(perform: {
                print("product ID: \(productId)")
                productDetailVM.getProductDetail(id: productId)
            })
    }
}

//struct ProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailView()
//    }
//}
