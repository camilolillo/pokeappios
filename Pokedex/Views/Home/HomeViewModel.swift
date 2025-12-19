import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    private let signOutUseCase: SignOutUseCaseProtocol
    private let listPokemonsUseCase: ListPokemonsProtocol
    private let getPokemonDetailUseCase: GetPokemonDetailProtocol
    @Published var items: [PokemonItem] = []
    private let onSignOut: () -> Void
    
    private var offset = 0
    private let limit = 20
    private var isLoading = false
    
    init(signOutUseCase: SignOutUseCaseProtocol, listPokemonsUseCase: ListPokemonsProtocol, getPokemonDetailUseCase: GetPokemonDetailProtocol, onSignOut: @escaping () -> Void) {
        self.signOutUseCase = signOutUseCase
        self.onSignOut = onSignOut
        self.listPokemonsUseCase = listPokemonsUseCase
        self.getPokemonDetailUseCase = getPokemonDetailUseCase
    }
}

extension HomeViewModel {
    func onAppear() async {
        await loadPokemons()
    }
}

extension HomeViewModel {
    func loadPokemons() async {
        guard !isLoading else { return }

        isLoading = true
        defer { isLoading = false }

        do {
            let newPokemons = try await listPokemonsUseCase.execute(
                limit: limit,
                offset: offset
            )

            items.append(contentsOf: newPokemons)
            offset += limit

        } catch {
            print("Error loading pokemons:", error)
        }
    }
    
    func onSignOutButtonPressed() {
        signOutUseCase.signOut { _ in
            self.onSignOut()
        }
    }
    
    func onPokemonSelected(item: PokemonItem) async throws -> Pokemon {
        try await getPokemonDetailUseCase.getPokemonBy(id: item.id)
    }
}
