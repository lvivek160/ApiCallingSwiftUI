//
//  NetworkManager.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 21/11/24.
//

import Foundation

// MARK: - NetworkManager
final class NetworkManager {
    
    static let shared = NetworkManager()
    private let decoder = ResponseDecoder()
    
    private init() {}

    func request<T: Decodable>(
        endpoint: APIEndpoint,
        responseType: T.Type
    ) async throws -> T {
        
        // Fetch the data asynchronously
        let data = try await performRequest(endpoint: endpoint)
        
        // Decode the data into the required model
        return try await decoder.decodeResponse(data: data, responseType: T.self)
    }
    
    // Perform the URL request asynchronously
    private func performRequest(endpoint: Endpoint) async throws -> Data {
        guard let urlRequest = endpoint.urlRequest else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }
        
        return data
    }
}
