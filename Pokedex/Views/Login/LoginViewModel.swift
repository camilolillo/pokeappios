//
//  LoginViewModel.swift
//  Pokedex
//
//  Created by Camilo Lillo on 17-12-25.
//
import Combine

final class LoginViewModel: ObservableObject {
    private let onLoginSuccess: () -> Void
    
    init(onLoginSuccess: @escaping () -> Void) {
        self.onLoginSuccess = onLoginSuccess
    }
}
