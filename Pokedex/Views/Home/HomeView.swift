import SwiftUI

struct HomeView: View {

    @StateObject var viewModel: HomeViewModel
    @State private var selectedPokemon: Pokemon?

    var body: some View {
        ZStack {
            Color.primaryColor
                .ignoresSafeArea()

            VStack(spacing: 12) {
                header

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

    func onSignOutButtonPressed() {
        viewModel.onSignOutButtonPressed()
    }
}

private extension HomeView {

    var pokemonScrollView: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(viewModel.items) { item in
                    pokemonRow(item: item)
                }
            }
        }
    }
}

private extension HomeView {

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
