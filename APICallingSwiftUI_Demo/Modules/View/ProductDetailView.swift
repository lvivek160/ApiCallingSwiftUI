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
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 0) {
                    TopSpacingView(withNavigationBarHeight: true)
                        .background(Color(.systemPink).opacity(0.5))
                    
                    VStack(spacing: 0) {
                        titleSubTitleView
                        priceAndImageView
                    }
                    .padding(.top, 10)
                    .background {
                        Color(.systemPink).opacity(0.5)
                    }
                
                    contentView
                }
            }
            bottomView
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity)
    }
    
    private var titleSubTitleView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(viewModel.product.category?.capitalized ?? "")
                .font(.system(size: 18, weight: .medium))
            Text(viewModel.product.title ?? "")
                .font(.system(size: 24, weight: .bold))
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
    }
    
    private var priceAndImageView: some View {
        ZStack {
            VStack {
                Spacer()
                RoundedCornerShape(corners: [.topLeft, .topRight], radius: 32)
                    .frame(height: 80)
                    .foregroundColor(.white)
            }
            
            HStack(alignment: .center, spacing: 10) {
                priceText
                AsyncImageView(urlString: viewModel.product.thumbnail)
                    .padding(.trailing, 10)
                    .shadow(color: .gray, radius: 10, x: -2, y: 5)
            }
            .padding(.horizontal, 16)
        }
    }
    
    private var priceText: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Price")
                .font(.system(size: 15, weight: .medium))
            Text("$" + (viewModel.product.price?.description ?? ""))
                .font(.system(size: 32, weight: .heavy))
            Spacer().frame(height: 50)
        }
    }
    
    private var contentView: some View {
        VStack(spacing: 12) {
            HStack {
                ratingView
                Spacer()
                productSizeView
            }
            
            Text(viewModel.product.description ?? "")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 16)
    }
    
    private var ratingView: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Rating")
                .foregroundColor(.gray)
                .font(.system(size: 14, weight: .medium))
            GrayStarRatingView(
                rating: viewModel.product.rating ?? 0.0
            )
        }
    }
    
    private var bottomView: some View {
        VStack {
            addToCartButton
        }
        .padding()
    }
    
    private var addToCartButton: some View {
        Button(action: {
            
        }, label: {
            Text("ADD TO CART")
                .font(.system(size: 18, weight: .bold))
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .frame(height: 48)
                .background(Color(.systemPink).opacity(0.5))
                .cornerRadius(.infinity)
        })
    }
    
    private var productSizeView: some View {
        VStack(alignment: .trailing, spacing: 6) {
            Text("Sizes")
                .foregroundColor(.gray)
                .font(.system(size: 14, weight: .medium))
            ProductSizesView()
        }
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
