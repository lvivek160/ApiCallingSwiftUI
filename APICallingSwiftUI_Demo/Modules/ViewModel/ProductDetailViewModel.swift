//
//  ProductDetailViewModel.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 22/11/24.
//

import Foundation

@MainActor
final class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
   
}
