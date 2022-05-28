//
//  ProductDetailView.swift
//  ocado_challenge
//
//  Created by MAC on 26/05/2022.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject var productDetailVM = ProductDetailViewModel()
    @StateObject var imageVM = ImageViewModel()
    let productId: Int
    let productDetailImageUrl: String
    var body: some View {
        VStack {
            if productDetailVM.loading {
                ProgressView {
                    Text("Loading Info...")
                }
            } else {
                Form {
                Section(header: Text("Title")) {
                    VStack {
                        Text(productDetailVM.productDetail.title)
                    }
                }
                Section(header: Text("Description")) {
                    Text(productDetailVM.productDetail.description)
                }
                Section(header: Text("Allergy information")) {
                    Text(productDetailVM.productDetail.allergyInformation)
                }
                Section(header: Text("Image")) {
                    HStack {
                        Spacer()
                        imageVM.image
                            .resizable()
                            .scaledToFit()
                            .frame(width:150, height: 150)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(10)
                        Spacer()
                    }
                }
            }
            
            .navigationBarTitle(Text("Product Detail"))
            }
        }
            .onAppear(perform: {
                //print("product ID: \(productId)")
                productDetailVM.getProductDetail(id: productId)
                imageVM.getNetworkImage(imageUrl: productDetailImageUrl)
            })
    }
}

//struct ProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailView()
//    }
//}
