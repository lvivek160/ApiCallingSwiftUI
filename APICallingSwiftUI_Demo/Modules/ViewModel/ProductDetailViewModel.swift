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
    @Published var selectedImageIndex: Int = 0
    
    init(product: Product) {
        self.product = product
    }
    
    func getProductImagesIndices() -> Range<Int> {
        guard let imagesCount = product.images?.count else {
            return 0..<0
        }
        return 0..<imagesCount
    }
    
    func getProductImage(by index: Int) -> String? {
        if let imagesCount = product.images?.count, ((index>=0) && (index < imagesCount)) {
            return product.images?[index]
        }
        return nil
    }
    
    func getSelectedImage() -> String? {
        return getProductImage(by: selectedImageIndex)
    }
    
    func isSelected(by index: Int) -> Bool {
        return selectedImageIndex == index
    }
    
}
