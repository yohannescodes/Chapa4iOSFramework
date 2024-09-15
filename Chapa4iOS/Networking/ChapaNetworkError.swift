//
//  ChapaNetworkError.swift
//  Chapa4iOS
//
//  Created by Yohannes Haile on 5/4/24.
//

import Foundation

enum ChapaNetworkError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
}

extension ChapaNetworkError: LocalizedError {
    var recoverySuggestion: String? {
        switch self {
        case .invalidURL:
            return "Please try again after crosschecking your input."
        case .networkError(_):
            return "The device seems to be offline. Please check your internet connection."
        case .decodingError(_):
            return "Something failed in the middle. Please report what occured."
        }
    }
}
