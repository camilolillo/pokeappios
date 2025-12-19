import SwiftUI

struct HomeView: View {

    @StateObject var viewModel: HomeViewModel
    @State private var selectedPokemon: Pokemon?
    @State private var selectedTab: SourceTab = .all

    var body: some View {
        ZStack {
            Color.primaryColor
                .ignoresSafeArea()

            VStack(spacing: 12) {
                header
                SourceTabBar(
                    selectedTab: selectedTab,
                    onTabSelected: { tab in
                        selectedTab = tab
                    }
                )
                pokemonScrollView
                    .padding(.top, 12)
                    .padding(.horizontal, 24)
            }
        }
        .task {
            await viewModel.onAppear()
        }
        .sheet(item: $selectedPokemon) { pokemon in
            PokemonDetailView(pokemon: pokemon)
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
                .presentationBackground(Color.primaryColor)
        }
    }
}

private extension HomeView {
    func onSignOutButtonPressed() {
        viewModel.onSignOutButtonPressed()
    }

    private var displayedItems: [PokemonItem] {
        switch selectedTab {
        case .all:
            return viewModel.items
        case .favorites:
            return viewModel.items.filter { $0.favorite }
        }
    }
}

private extension HomeView {
    var header: some View {
        HStack {
            IsoLogo()
            Spacer()
            signOutButton
        }
        .padding(.horizontal, 24)
        .padding(.top, 12)
    }

    var signOutButton: some View {
        Button(action: onSignOutButtonPressed) {
            Text("Sign Out")
                .font(.headline)
                .foregroundColor(.white)
        }
    }

    var pokemonScrollView: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(displayedItems) { item in
                    pokemonRow(item: item)
                }
            }
        }
    }
    
    func pokemonRow(item: PokemonItem) -> some View {
        let rowData = PokemonItemRowDataModel(item: item)

        return PokemonItemRowView(
            dataModel: rowData,
            onFavoriteTapped: {
                viewModel.onFavoriteTapped(itemId: item.id)
            }
        )
        .onAppear {
            if item.id == viewModel.items.last?.id {
                Task {
                    await viewModel.loadPokemons()
                }
            }
        }
        .onTapGesture {
            Task {
                do {
                    selectedPokemon = try await viewModel.onPokemonSelected(item: item)
                } catch {
                    print(error)
                }
            }
        }
    }
}
