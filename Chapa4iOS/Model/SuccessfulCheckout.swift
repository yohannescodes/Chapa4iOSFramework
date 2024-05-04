//
//  SuccessfulPayment.swift
//  Chapa4iOS
//
//  Created by Yohannes Haile on 5/4/24.
//

import Foundation

// MARK: - SuccessfulCheckout
struct SuccessfulCheckout: Codable {
    let message, status: String
    let data: CheckoutDataClass
}

// MARK: - DataClass
struct CheckoutDataClass: Codable {
    let checkoutURL: String

    enum CodingKeys: String, CodingKey {
        case checkoutURL = "checkout_url"
    }
}
