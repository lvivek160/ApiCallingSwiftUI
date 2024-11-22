//
//  LoadingView.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 22/11/24.
//

import SwiftUI

struct LoadingView: View {
    @Binding var isLoading: Bool
    var message: String? = "Loading..."
    var backgroundOpacity: Double = 0.4
    var showDimBackground: Bool = true

    var body: some View {
        if isLoading {
            ZStack {
                if showDimBackground {
                    Color.black.opacity(backgroundOpacity)
                        .edgesIgnoringSafeArea(.all)
                }

                VStack(spacing: 16) {
                    ProgressView()
                        .scaleEffect(1.5)
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))

                    if let message = message {
                        Text(message)
                            .font(.headline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                    }
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .shadow(radius: 10)
                )
            }
            .transition(.opacity.animation(.easeInOut(duration: 0.3)))
        }
    }
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isLoading: .constant(true))
    }
}
