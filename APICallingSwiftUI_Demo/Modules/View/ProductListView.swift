//
//  ProductListView.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 21/11/24.
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel = ProductViewModel()
    @State private var isLoading: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                productGridView
            }
            .navigationTitle("Products")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal)
            .task {
                isLoading = true
                await viewModel.fetchProduct()
                isLoading = false
            }
        }
    }
    
    private var productGridView: some View {
        LazyVGrid(
            columns: [GridItem(.flexible()), GridItem(.flexible())],
            spacing: 8
        ) {
            ForEach(viewModel.products, id: \.self) { product in
                ProductCellView(product: product)
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
