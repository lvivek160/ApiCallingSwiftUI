//
//  BaseViewModel.swift
//  APICallingSwiftUI_Demo
//
//  Created by Neosoft on 22/11/24.
//

import Foundation

@MainActor
class BaseViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var isShowAlert: Bool = false
    @Published var errorTitle: String = "Oops!"
    @Published var errorMessage: String? {
        didSet {
            isShowAlert = !(errorMessage?.isEmpty ?? true)
        }
    }
}
