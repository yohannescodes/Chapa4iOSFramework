//
//  Customer.swift
//  Chapa4iOS
//
//  Created by Yohannes Haile on 5/4/24.
//

import Foundation

// MARK: - Customer
public struct Customer: Codable {
    public var amount: String
    public var currency: ChapaCurrency
    public var email: String?
    public var firstName: String?
    public var lastName: String?
    public var phoneNumber: String?
    public var txRef: String
    public var callbackURL: String?
    public var returnURL: String?
    public var customization: ChapaCustomization?
    
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
    
    public init(amount: String, currency: ChapaCurrency, email: String?, firstName: String?, lastName: String?, phoneNumber: String?, txRef: String, callbackURL: String?, returnURL: String?, customization: ChapaCustomization?) {
        self.amount = amount
        self.currency = currency
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.txRef = txRef
        self.callbackURL = callbackURL
        self.returnURL = returnURL
        self.customization = customization
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

