//
//  SplashViewModel.swift
//  Pokedex
//
//  Created by Camilo Lillo on 17-12-25.
//
import Combine

final class SplashViewModel: ObservableObject {

    private let onCheckSession: () -> Void
    
    init(onCheckSession: @escaping () -> Void) {
        self.onCheckSession = onCheckSession
    }

    func onAppear() {
        checkSession()
    }

    private func checkSession() {
        onCheckSession()
    }
}
