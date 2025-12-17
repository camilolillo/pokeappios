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
        Color.white
            .ignoresSafeArea()
        VStack {
            Text("HOME")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}
