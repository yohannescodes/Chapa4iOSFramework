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
    @CodableExplicitNull public var email: String? = nil
    @CodableExplicitNull public var firstName: String? = nil
    @CodableExplicitNull public var lastName: String? = nil
    @CodableExplicitNull public var phoneNumber: String? = nil
    public var txRef: String
    @CodableExplicitNull public var callbackURL: String? = nil
    @CodableExplicitNull public var returnURL: String? = nil
    @CodableExplicitNull public var customization: ChapaCustomization? = nil
    
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
    
    public init(amount: String, currency: ChapaCurrency, email: String?, firstName: String?, lastName: String?, phoneNumber: String?, txRef: String, callbackURL: String?, returnURL: String? = nil, customization: ChapaCustomization?) {
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
    @CodableExplicitNull public var title: String? = nil
    @CodableExplicitNull public var description: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case title, description
    }
    
    public init(title: String?, description: String?) {
        self.title = title
        self.description = description
    }
}

public enum ChapaCurrency: String, Codable {
    case etb = "ETB"
    case usd = "USD"
}

