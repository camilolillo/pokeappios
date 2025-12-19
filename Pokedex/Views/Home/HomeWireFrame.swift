import SwiftData

@MainActor
struct HomeWireframe {
    static func createModule(
        modelContext: ModelContext,
        onSignOut: @escaping () -> Void
    ) -> HomeView {
        let localStorageManager = LocalStorageManager(context: modelContext)
        let signOutUseCase = SignOutUseCase(localStorageManager: localStorageManager)
        
        let pokemonService = PokemonService()
        let listPokemonUseCase = ListPokemons(service: pokemonService)
        let getPokemonUseCase = GetPokemonDetail(service: pokemonService)
        
        let viewModel = HomeViewModel(signOutUseCase: signOutUseCase, listPokemonsUseCase: listPokemonUseCase, getPokemonDetailUseCase: getPokemonUseCase, onSignOut: onSignOut)
        
        return HomeView(viewModel: viewModel)
    }
}
