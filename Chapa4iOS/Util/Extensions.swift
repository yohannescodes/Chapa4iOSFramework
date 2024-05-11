//
//  Extensions.swift
//  Chapa4iOS
//
//  Created by Yohannes Haile on 5/4/24.
//

import Foundation

extension String{
    static func random(length: Int = 15) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}

@propertyWrapper
public struct CodableExplicitNull<Wrapped> {
    public var wrappedValue: Wrapped?
    
    public init(wrappedValue: Wrapped?) {
        self.wrappedValue = wrappedValue
    }
}

extension CodableExplicitNull: Encodable where Wrapped: Encodable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch wrappedValue {
        case .some(let value): try container.encode(value)
        case .none: try container.encodeNil()
        }
    }
}

extension CodableExplicitNull: Decodable where Wrapped: Decodable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            wrappedValue = try container.decode(Wrapped.self)
        }
    }
}

extension CodableExplicitNull: Equatable where Wrapped: Equatable { }

extension KeyedDecodingContainer {
    
    public func decode<Wrapped>(_ type: CodableExplicitNull<Wrapped>.Type,
                                forKey key: KeyedDecodingContainer<K>.Key) throws -> CodableExplicitNull<Wrapped> where Wrapped: Decodable {
        return try decodeIfPresent(CodableExplicitNull<Wrapped>.self, forKey: key) ?? CodableExplicitNull<Wrapped>(wrappedValue: nil)
    }
}
