//
//  ProductRepository.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 21/11/24.
//

import Foundation

final class ProductRepository {
    private let networkManager = NetworkManager.shared
    
    func fetchProduct() async throws -> [Product] {
        return try await fetchProductFromAPI()
    }
    
    private func fetchProductFromAPI() async throws -> [Product] {
        let response = try await networkManager.request(
            endpoint: .product,
            responseType: ProductModel.self
        )
        return response.products ?? []
    }
}
