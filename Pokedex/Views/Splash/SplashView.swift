//
//  SplashView.swift
//  Pokedex
//
//  Created by Camilo Lillo on 17-12-25.
//
import SwiftUI

struct SplashView: View {

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()

            VStack(spacing: 12) {
                Text("Pokédex")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                ProgressView()
            }
        }
    }
}
