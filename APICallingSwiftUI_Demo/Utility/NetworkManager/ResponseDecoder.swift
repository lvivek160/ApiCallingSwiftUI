//
//  ResponseDecoder.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 21/11/24.
//

import Foundation

final class ResponseDecoder {
    private let decoder = JSONDecoder()
    
    func decodeResponse<T: Decodable>(data: Data, responseType: T.Type) async throws -> T {
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw APIError.decodingError(error)
        }
    }
}
