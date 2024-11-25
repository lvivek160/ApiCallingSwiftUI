//
//  GrayStarRatingView.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 25/11/24.
//

import SwiftUI

struct GrayStarRatingView: View {
    var rating: Double
    var maxStars: Int = 5
    var spacing: CGFloat = 6
    var starImageSize: CGFloat = 14
    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<maxStars, id: \.self) { index in
                star(for: index)
                    .frame(width: starImageSize, height: starImageSize)
                    .padding(4)
                    .background {
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundColor(Color(.gray).opacity(0.5))
                    }
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
            filledStar.foregroundColor(.white)
        } else if rating > Double(index) + 0.25 {
            halfStar.foregroundColor(.white)
        } else {
            emptyStar.foregroundColor(.white)
        }
    }
}


struct GrayStarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        GrayStarRatingView(rating: 3.5)
    }
}
