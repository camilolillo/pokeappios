//
//  SplashView.swift
//  Pokedex
//
//  Created by Camilo Lillo on 17-12-25.
//
import SwiftUI

struct SplashView: View {

    @StateObject var viewModel: SplashViewModel

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack(spacing: 12) {
                Text("SPLASH")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        }
        .onAppear() {
            viewModel.onAppear()
        }
    }
}
