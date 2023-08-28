//
//  ProductModel.swift
//  ECommerce
//
//  Created by Seda Şahin on 24.08.2023.
//

import Foundation

struct Model:Codable {
   let products: [Products]?
   let total: Int?
   let skip: Int?
   let limit: Int?
}

struct Products: Codable {
    let id: Int?
    let title: String?
    let description: String?
    let price: Double?
    let discountPercentage: Double?
    let rating: Double?
    let stock: Int?
    let brand: String?
    let category: String?
    let thumbnail: String?
    let images: [String]?
}

struct AddCart: Codable {
    let userId: Int?
    let products: AddCartProduct?
   
}

struct AddCartProduct: Codable {
    let id: String?
    let quantity: Int?
}

