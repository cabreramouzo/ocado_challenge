//
//  ProductListModel.swift
//  ocado_challenge
//
//  Created by MAC on 25/05/2022.
//

import Foundation

struct ApiResult: Decodable {
    var clusters: [Cluster]?
}

struct Cluster: Decodable, Hashable {
    var tag: String
    var items: [Product]
}

struct Product: Decodable, Hashable {
    var id: Int
    var price: String
    var title: String
    var size: String
    var imageUrl: String
}
