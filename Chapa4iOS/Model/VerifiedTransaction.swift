//
//  VerifiedTransaction.swift
//  Chapa4iOS
//
//  Created by Yohannes Haile on 5/4/24.
//

import Foundation

// MARK: - VerifiedTransaction
struct VerifiedTransaction: Codable {
    let message, status: String
    let data: VerifiedDataClass
}

// MARK: - DataClass
struct VerifiedDataClass: Codable {
    let firstName, lastName, email: String?
    let currency: String?
    let amount: Int
    let charge: Double
    let mode, method, type, status: String
    let reference, txRef: String
    let customization: ChapaCustomization?

    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case email, currency, amount, charge, mode, method, type, status, reference
        case txRef = "tx_ref"
        case customization
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
