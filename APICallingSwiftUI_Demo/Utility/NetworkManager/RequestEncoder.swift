//
//  RequestEncoder.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 21/11/24.
//

import Foundation

final class RequestEncoder {
    private let encoder = JSONEncoder()
    
    func encodeRequest<T: Encodable>(_ value: T) async throws -> Data {
        do {
            return try encoder.encode(value)
        } catch {
            throw APIError.encodingError(error)
        }
    }
    
}
