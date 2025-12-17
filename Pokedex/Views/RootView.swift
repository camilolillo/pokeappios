//
//  RootView.swift
//  Pokedex
//
//  Created by Camilo Lillo on 17-12-25.
//
import SwiftUI

enum AppRoute {
    case splash
    case login
    case home
}

struct RootView: View {
    @State private var route: AppRoute = .login
    var body: some View {
        NavigationView {
            switch route {
            case .splash:
                SplashView(viewModel: SplashViewModel())
            case .login:
                LoginView(viewModel: LoginViewModel())
            case .home:
                HomeView(viewModel: HomeViewModel())
            }
        }
    }
}
