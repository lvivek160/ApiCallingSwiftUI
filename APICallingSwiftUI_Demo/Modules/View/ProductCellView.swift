//
//  ProductCellView.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 21/11/24.
//

import SwiftUI

struct ProductCellView: View {
    let product: Product
    @State private var isLike: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top, spacing: 10) {
                thumbnailImageView
                priceText
            }
            
            VStack(alignment: .leading, spacing: 6) {
                titleText
                detailTexts
            }
            
            HStack {
                likeView
                Spacer()
                review
            }
        }
        .tint(.black)
        .padding(12)
        .overlay {
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.black.opacity(0.2))
        }
    }
    
    private var thumbnailImageView: some View {
        AsyncImageView(urlString: product.thumbnail)
    }
    
    private var priceText: some View {
        Text("$ " + Int(product.price ?? 0).description)
            .font(.system(size: 20, weight: .medium))
    }
    
    private var titleText: some View {
        Text(product.title ?? "")
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.indigo)
            .lineLimit(1)
    }
    
    private var detailTexts: some View {
        VStack(alignment: .leading, spacing: 4) {
            if let brand = product.brand {
                detailText(brand)
            }
            
            if let category = product.category {
                detailText(category)
            }
            
            if let availabilityStatus = product.availabilityStatus {
                detailText(availabilityStatus)
            }
        }
        .font(.system(size: 12, weight: .regular))
    }
    
    private func detailText(_ title: String) -> some View {
        HStack {
            Circle().frame(width: 4, height: 4)
            Text(title)
        }
    }
    
    private var review: some View {
        VStack(alignment: .leading, spacing: 8) {
            StarRatingView(rating: product.rating ?? 0)
            
            if let reviews = product.reviews?.count.description {
                Text(reviews + " Reviews")
                    .foregroundColor(.indigo)
                    .font(.system(size: 12, weight: .semibold))
            }
        }
    }
    
    private var likeView: some View {
        HStack(spacing: 10) {
            Button(action: {
                isLike.toggle()
            }) {
                Image(systemName: "heart" + (isLike ? ".fill" : ""))
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(isLike ? .red : .gray)
            }
            
            Text(isLike ? "Saved for later" : "Save for later")
                .font(.system(size: 10, weight: .regular))
                .foregroundColor(isLike ? .red : .gray)
                .multilineTextAlignment(.leading)
        }
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 16) {
            ProductCellView(product: ProductModel.dummyProduct)
            ProductCellView(product: ProductModel.dummyProduct)
        }
        .padding()
    }
}
