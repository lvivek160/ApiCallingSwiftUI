//
//  ProductSizesView.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 25/11/24.
//

import SwiftUI

struct ProductSizesView: View {
    private var sizesTexts: [String] = ["XS", "S", "M", "L", "XL"]
    
    var body: some View {
        HStack {
            ForEach(sizesTexts, id: \.self) { text in
                ProductSizesCell(name: text)
            }
        }
    }
}

fileprivate struct ProductSizesCell: View {
    let name: String
    
    var body: some View {
        Text(name)
            .foregroundColor(.gray)
            .font(.system(size: 10, weight: .semibold))
            .frame(width: 16, height: 16)
            .padding(4)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(.gray).opacity(0.5))
            }
    }
}

struct ProductSizesView_Previews: PreviewProvider {
    static var previews: some View {
        ProductSizesView()
    }
}
