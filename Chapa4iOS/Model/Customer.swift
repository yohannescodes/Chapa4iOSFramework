//
//  Customer.swift
//  Chapa4iOS
//
//  Created by Yohannes Haile on 5/4/24.
//

import Foundation

// MARK: - Customer
struct Customer: Codable {
    let amount: Double
    let currency: ChapaCurrency
    let email, firstName: String?
    let lastName, phoneNumber: String?
    let txRef: String
    let callbackURL, returnURL: String?
    let customization: ChapaCustomization?

    enum CodingKeys: String, CodingKey {
        case amount, currency, email
        case firstName = "first_name"
        case lastName = "last_name"
        case phoneNumber = "phone_number"
        case txRef = "tx_ref"
        case callbackURL = "callback_url"
        case returnURL = "return_url"
        case customization
    }
}

struct ChapaCustomization: Codable {
    let title: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case title, description
    }
}

enum ChapaCurrency: String, Codable {
    case etb = "ETB"
    case usd = "USD"
}

