//
//  SplashViewModel.swift
//  Pokedex
//
//  Created by Camilo Lillo on 17-12-25.
//
import Combine

final class SplashViewModel: ObservableObject {

    @Published private(set) var hasActiveSession: Bool?

    func onAppear() {
        checkSession()
    }

    private func checkSession() {
        hasActiveSession = true
    }
}
