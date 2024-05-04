//
//  ChapaNetworkManager.swift
//  Chapa4iOS
//
//  Created by Yohannes Haile on 5/4/24.
//

import Foundation

public class ChapaNetworkManager{
    
    private func get<T: Decodable>(path: String, token: String, queryItems: [URLQueryItem]? = nil) async throws -> T {
        var urlComps = URLComponents(string: path)!
        
        if let queryItems = queryItems {
            urlComps.queryItems = queryItems
        }
        
        let url = urlComps.url!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        
        return try await sendRequest(request)
    }
    
    private func post<T: Decodable, U: Encodable>(path: String, token: String, parameters: U) async throws -> T {
        let url = URL(string: path)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        request.httpBody = try encoder.encode(parameters)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        
        return try await sendRequest(request)
    }
    
    
    private func sendRequest<T: Decodable>(_ request: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let _ = response as? HTTPURLResponse else {
            let error = ChapaNetworkError.noNetwork
            print(error.localizedDescription)
            throw error
        }
        
        do {
            
            let jsonresult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSDictionary
            print(jsonresult)
            
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch (let error) {
            print("Unknown Error: \(error)")
            throw ChapaNetworkError.unknownError
        }
    }
}

extension ChapaNetworkManager{
    func acceptPayment(customer: Customer, key: String) async throws -> SuccessfulCheckout{
        return try await post(path: ChapaConstants.acceptPayment, token: key, parameters: customer)
    }
    
    func verifyPayment(transactionRefference: String, key: String) async throws -> VerifiedTransaction{
        return try await get(path: ChapaConstants.verifyPayment + transactionRefference, token: key)
    }
}
