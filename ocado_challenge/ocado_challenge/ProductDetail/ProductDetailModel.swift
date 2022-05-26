//
//  ProductDetailModel.swift
//  ocado_challenge
//
//  Created by MAC on 26/05/2022.
//

import Foundation

func getProductUrl(product id: Int) -> URL {
    return URL(string: "https://my-json-server.typicode.com/ocadotechnology/mobile-challenge/product/\(id)")!
}

struct ProductDetail: Decodable, Hashable {
    var id: Int
    var price: String
    var title: String
    var imageUrl: String
    var description: String
    var allergyInformation: String
}
