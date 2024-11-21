//
//  SwiftUIView.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 21/11/24.
//

import SwiftUI

struct StarRatingView: View {
    var rating: Double
    var maxStars: Int = 5
    var spacing: CGFloat = 1
    var starImageSize: CGFloat = 10 // Adjust the size of individual stars
    
    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<maxStars, id: \.self) { index in
                star(for: index)
                    .frame(width: starImageSize, height: starImageSize)
            }
        }
    }
    
    // Determines the star view for the given index
    @ViewBuilder
    private func star(for index: Int) -> some View {
        let filledStar = Image(systemName: "star.fill")
            .resizable()
        let halfStar = Image(systemName: "star.leadinghalf.filled")
            .resizable()
        let emptyStar = Image(systemName: "star")
            .resizable()
               
        
        if rating > Double(index) + 0.75 {
            filledStar.foregroundColor(.yellow)
        } else if rating > Double(index) + 0.25 {
            halfStar.foregroundColor(.yellow)
        } else {
            emptyStar.foregroundColor(.gray)
        }
    }
}

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView(rating: 3.5) // Adjust the size for preview
            .padding() // Optional padding around the view
    }
}
