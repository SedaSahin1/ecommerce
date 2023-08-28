//
//  BasketModel.swift
//  ECommerce
//
//  Created by Seda Şahin on 24.08.2023.
//

import Foundation

struct BasketModel:Codable {
    let id: Int?
    let products: [BasketProducts]?
    let total: Int?
    let discountedTotal: Int?
    let userId: Int?
    let totalProducts: Int?
    let totalQuantity: Int?
}

struct BasketProducts: Codable {
    let id: Int?
    let title: String?
    let price: Double?
    let quantity: Int?
    let total: Int?
    let discountPercentage: Double?
    let discountedPrice: Double?
}
