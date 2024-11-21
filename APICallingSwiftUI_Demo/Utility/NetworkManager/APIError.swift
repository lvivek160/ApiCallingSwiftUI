//
//  APIError.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 21/11/24.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError(Error)
    case encodingError(Error)
    case networkError
    case unknownError(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Oops! Something went wrong with the request. Please try again."
        case .invalidResponse:
            return "We couldn't fetch the data. Please check your internet connection and try again."
        case .decodingError:
            return "There was a problem processing the data. Please try again later."
        case .encodingError:
            return "Something went wrong while preparing your data. Please try again later."
        case .networkError:
            return "Network error occurred. Please check your connection and try again."
        case .unknownError(let message):
            return message.isEmpty ? "An unexpected error occurred. Please try again later." : message
        }
    }
}
