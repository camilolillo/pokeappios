//
//  LoginView.swift
//  Pokedex
//
//  Created by Camilo Lillo on 17-12-25.
//
import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack(spacing: 12) {
                Text("LOGIN")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        }
    }
}
