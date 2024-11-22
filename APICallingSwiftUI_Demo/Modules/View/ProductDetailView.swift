//
//  ProductDetailView.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 21/11/24.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject var viewModel: ProductDetailViewModel
    
    var body: some View {
        Text(viewModel.product.title ?? "")
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(
            viewModel: ProductDetailViewModel(
                product: ProductModel.dummyProduct
            )
        )
    }
}
