//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Camilo Lillo on 17-12-25.
//
import Combine

final class HomeViewModel: ObservableObject {
    private let onSignOut: () -> Void
    
    init(onSignOut: @escaping () -> Void) {
        self.onSignOut = onSignOut
    }
}
