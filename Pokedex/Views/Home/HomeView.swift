import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            Color.primaryColor
                .ignoresSafeArea()
            VStack (spacing: 12) {
                HStack {
                    IsoLogo()
                    Spacer()
                    signOutButton
                }
                .padding(.horizontal, 24)
                .padding(.top, 12)
                pokemonScrollView
                .padding(.top, 12)
                .padding(.horizontal, 24)
            }
        }.task {
            await viewModel.onAppear()
        }
    }
    
    private var signOutButton: some View {
        Button(action: onSignOutButtonPressed) {
            Text("Sign Out")
                .font(.headline)
                .foregroundColor(Color.white)
        }
    }
    
    private var pokemonScrollView: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(viewModel.items) { item in
                    PokemonItemRowView(
                        dataModel: .init(item: item)
                    ).onAppear {
                        if item.id == viewModel.items.last?.id {
                            Task {
                                await viewModel.loadPokemons()
                            }
                        }
                    }
                    .onTapGesture {
                        Task {
                            Task {
                                do {
                                    let pokemon = try await viewModel.onPokemonSelected(item: item)
                                    print(pokemon)
                                } catch {
                                    print(error)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

extension HomeView {
    func onSignOutButtonPressed() {
        viewModel.onSignOutButtonPressed()
    }
}
