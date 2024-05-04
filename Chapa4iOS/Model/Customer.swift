//
//  Customer.swift
//  Chapa4iOS
//
//  Created by Yohannes Haile on 5/4/24.
//

import Foundation

// MARK: - Customer
public struct Customer: Codable {
    public var amount: Double
    public var currency: ChapaCurrency
    public var email: String? = nil
    public var firstName: String? = nil
    public var lastName: String? = nil
    public var phoneNumber: String? = nil
    public var txRef: String
    public var callbackURL: String? = nil
    public var returnURL: String? = nil
    public var customization: ChapaCustomization? = nil
    
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

public struct ChapaCustomization: Codable {
    public var title: String
    public var description: String
    
    enum CodingKeys: String, CodingKey {
        case title, description
    }
}

public enum ChapaCurrency: String, Codable {
    case etb = "ETB"
    case usd = "USD"
}

