//
//  ProductViewModel.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 21/11/24.
//

import Foundation

@MainActor
final class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var errorMessage: String?
    private let repository = ProductRepository()
    
    func fetchProduct() {
        Task {
            do {
                products = try await repository.fetchProduct()
            } catch let error as APIError {
                errorMessage = error.errorDescription
            }
        }
    }
}
