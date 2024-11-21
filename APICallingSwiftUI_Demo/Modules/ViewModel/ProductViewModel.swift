//
//  ProductViewModel.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 21/11/24.
//

import Foundation

final class ProductViewModel: ObservableObject {
    @Published var products: [Product] = [ProductModel.dummyProduct, ProductModel.dummyProduct, ProductModel.dummyProduct, ProductModel.dummyProduct]
}
