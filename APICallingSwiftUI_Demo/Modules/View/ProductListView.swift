//
//  ProductListView.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 21/11/24.
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                productGridView
            }
            .onAppear {
                viewModel.fetchProduct()
            }
            .navigationTitle("Products")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
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
