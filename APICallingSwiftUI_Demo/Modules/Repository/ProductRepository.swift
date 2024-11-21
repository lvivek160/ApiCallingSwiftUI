//
//  ProductRepository.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 21/11/24.
//

import Foundation

protocol ProductRepositoryProtocol {
    func fetchProduct() async throws -> [Product]
}

final class ProductRepository {
    private let networkManager = NetworkManager.shared
    
    private func fetchProductFromAPI() async throws -> [Product] {
        let response = try await networkManager.request(
            endpoint: .product,
            responseType: ProductModel.self
        )
        return response.products ?? []
    }
}

extension ProductRepository: ProductRepositoryProtocol {
    func fetchProduct() async throws -> [Product] {
        return try await fetchProductFromAPI()
    }
}
