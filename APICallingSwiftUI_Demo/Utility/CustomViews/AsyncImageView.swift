//
//  AsyncImageView.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 22/11/24.
//

import SwiftUI

struct AsyncImageView: View {
    let urlString: String?
    
    var body: some View {
        GeometryReader { geometry in
            ImageView
            .frame(width: geometry.size.width, height: geometry.size.width)
            .clipped()
        }
        .aspectRatio(1, contentMode: .fit)
    }
    
    private var ImageView: some View {
        AsyncImage(
            url: URL(string: urlString ?? ""),
            content: { image in
                image
                  .resizable(resizingMode: .stretch)
                  .aspectRatio(contentMode: .fill)
            },
            placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            }
        )
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView(urlString: "https://g1.img-dpreview.com/80513CED05A944D08EDD9F1A75A58764.jpg")
    }
}
