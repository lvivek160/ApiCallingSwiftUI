//
//  TopSpacingView.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 25/11/24.
//

import SwiftUI

struct TopSpacingView: View {
    var withNavigationBarHeight: Bool = false
    @State private var topSpacing: CGFloat = 0


    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(height: topSpacing)
            .onAppear {
                calculateTopSpacingForLegacy()
            }
    }

    private func calculateTopSpacingForLegacy() {
        DispatchQueue.main.async {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                topSpacing = window.safeAreaInsets.top + (withNavigationBarHeight ? 44 : 0)
            } else {
                topSpacing = 0
            }
        }
    }
}
