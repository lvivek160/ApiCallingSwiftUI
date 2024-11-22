//
//  ProductViewModel.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 21/11/24.
//

import Foundation

@MainActor
final class ProductViewModel: BaseViewModel {
    @Published var products: [Product] = []
    @Published var selectedProduct: Product?
    
    private let repository: ProductRepositoryProtocol = ProductRepository()
    
    func fetchProduct() async {
        errorMessage = nil
        isLoading = true
        do {
            products = try await repository.fetchProduct()
        } catch let error as APIError {
            errorMessage = error.errorDescription
        } catch {
            errorMessage = APIError.unknownError("").errorDescription
        }
        isLoading = false
    }
}
