//
//  Customer.swift
//  Chapa4iOS
//
//  Created by Yohannes Haile on 5/4/24.
//

import Foundation

// MARK: - Customer
struct Customer: Codable {
    var amount: Double
    var currency: ChapaCurrency
    var email: String? = nil
    var firstName: String? = nil
    var lastName: String? = nil
    var phoneNumber: String? = nil
    var txRef: String
    var callbackURL: String? = nil
    var returnURL: String? = nil
    var customization: ChapaCustomization? = nil

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
    var title: String
    var description: String

    enum CodingKeys: String, CodingKey {
        case title, description
    }
}

enum ChapaCurrency: String, Codable {
    case etb = "ETB"
    case usd = "USD"
}

