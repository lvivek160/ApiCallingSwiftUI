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
            ZStack {
                ScrollView {
                    productGridView
                }
               
                LoadingView(isLoading: $viewModel.isLoading)
            }
            .navigationTitle("Products")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.fetchProduct()
            }
            .alert(
                viewModel.errorTitle,
                isPresented: $viewModel.isShowAlert,
                actions: {
                    Button("OK") {}
                },
                message: {
                    Text(viewModel.errorMessage ?? "")
                }
            )

        }
    }
    
    private var productGridView: some View {
        LazyVGrid(
            columns: [GridItem(.flexible()), GridItem(.flexible())],
            spacing: 8
        ) {
            ForEach(viewModel.products, id: \.self) { product in
                NavigationLink(
                    destination: ProductDetailView(viewModel: viewModel)
                ) {
                    ProductCellView(product: product)
                      .onTapGesture {
                          viewModel.selectedProduct = product
                      }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
