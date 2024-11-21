//
//  EndPoint.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 21/11/24.
//

import Foundation


// MARK: - HttpMethod
enum HttpMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
}


// MARK: - Endpoint
protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HttpMethod { get }
    var body: Data? { get }
    var headers: [String: String] { get }
    var urlRequest: URLRequest? { get }
}


enum APIEndpoint {
    case product
}

// MARK: - Endpoint Conformance
extension APIEndpoint: Endpoint {

    var baseURL: String {
        return "https://dummyjson.com/"
    }

    var path: String {
        switch self {
        case .product:
            return "products"
        }
    }

    var httpMethod: HttpMethod {
        switch self {
        case .product:
            return .get
        }
    }
    
    var body: Data? {
        return nil
    }

    var headers: [String: String] {
        return [:]
    }

    var urlRequest: URLRequest? {
        guard let url = URL(string: baseURL + path) else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body

        // Set headers
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }

        return request
    }
}
