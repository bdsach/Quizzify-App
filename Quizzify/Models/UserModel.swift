//
//  UserLoginModel.swift
//  Quizzify
//
//  Created by Bandit Silachai on 5/1/24.
//

import Foundation

struct UserLogin: Codable {
    let email: String
    let password: String
}

struct Profile: Codable {
    let email: String
    let firstName: String?
    let lastName: String?
    
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
