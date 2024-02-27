//
//  ProductModel.swift
//  Fake E Store
//
//  Created by Aniket Kumar on 11/02/24.
//

import Foundation

struct ProductModel: Codable {
    let id: Int
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

struct Rating: Codable {
    let rate: Float
    let count: Int
}
