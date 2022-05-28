//
//  ProductDetailModel.swift
//  ocado_challenge
//
//  Created by MAC on 26/05/2022.
//

import Foundation

struct ProductDetail: Decodable, Hashable {
    var id: Int
    var price: String
    var title: String
    var imageUrl: String
    var description: String
    var allergyInformation: String
}
