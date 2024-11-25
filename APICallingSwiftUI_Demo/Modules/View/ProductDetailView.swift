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
        ScrollView {
            VStack {
                mainImageView
                thumbnailGridView
            }
        }
    }
    
    private var mainImageView: some View {
        AsyncImageView(urlString: viewModel.getSelectedImage())
            .padding()
    }
    
    private var thumbnailGridView: some View {
        LazyHGrid(rows: [GridItem(.flexible())]) {
            ForEach(
                viewModel.getProductImagesIndices(),
                id: \.self
            ) { index in
                Button(action: {
                    viewModel.selectedImageIndex = index
                }) {
                    ProductDetailImageCell(
                        imageString: viewModel.getProductImage(by: index),
                        isSelected: .init(get: { viewModel.isSelected(by: index) }, set: { _ in })
                    )
                }
                .frame(width: 60)
            }
        }
    }
    
}

struct ProductDetailImageCell: View {
    let imageString: String?
    @Binding var isSelected: Bool
    
    var body: some View {
        AsyncImageView(urlString: imageString)
            .border(isSelected ? .red : .clear)
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
