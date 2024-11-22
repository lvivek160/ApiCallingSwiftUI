//
//  ProductDetailView.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 21/11/24.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject var viewModel: ProductViewModel
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductViewModel())
    }
}
