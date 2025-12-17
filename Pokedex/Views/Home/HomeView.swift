//
//  HomeView.swift
//  Pokedex
//
//  Created by Camilo Lillo on 17-12-25.
//
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack (spacing: 12) {
                Text("HOME")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        }
    }
}
