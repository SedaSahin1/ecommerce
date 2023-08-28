//
//  Loginmodel.swift
//  ECommerce
//
//  Created by Seda Şahin on 24.08.2023.
//

import Foundation

struct LoginModel:Codable {
    let id: Int?
    let username: String?
    let email: String?
    let firstName: String?
    let lastName: String?
    let gender: String?
    let image: String?
    let token: String?
}

