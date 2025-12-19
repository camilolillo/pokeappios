import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    private let signOutUseCase: SignOutUseCaseProtocol
    private let listPokemonsUseCase: ListPokemonsProtocol
    private let getPokemonDetailUseCase: GetPokemonDetailProtocol
    private let storeFavoriteUseCase: StoreFavoriteProtocol
    private let removeFavoriteUseCase: RemoveFavoriteProtocol
    private let listFavoritesPokemonsUseCase: ListFavoritePokemonsProtocol
    private let onSignOut: () -> Void
    
    @Published var items: [PokemonItem] = []
    @Published var favoriteItems: [FavoritePokemonItem] = []
    
    private var offset = 0
    private let limit = 20
    private var isLoading = false
    
    init(signOutUseCase: SignOutUseCaseProtocol, listPokemonsUseCase: ListPokemonsProtocol, getPokemonDetailUseCase: GetPokemonDetailProtocol, storeFavoriteUseCase: StoreFavoriteProtocol, removeFavoriteUseCase: RemoveFavoriteProtocol, listFavoritesPokemonsUseCase: ListFavoritePokemonsProtocol, onSignOut: @escaping () -> Void) {
        self.signOutUseCase = signOutUseCase
        self.onSignOut = onSignOut
        self.listPokemonsUseCase = listPokemonsUseCase
        self.getPokemonDetailUseCase = getPokemonDetailUseCase
        self.storeFavoriteUseCase = storeFavoriteUseCase
        self.listFavoritesPokemonsUseCase = listFavoritesPokemonsUseCase
        self.removeFavoriteUseCase = removeFavoriteUseCase
    }
}

extension HomeViewModel {
    func onAppear() async {
        await loadPokemons()
        loadFavoritePokemons()
    }
}

extension HomeViewModel {
    private func loadFavoritePokemons() {
        favoriteItems = listFavoritesPokemonsUseCase.getFavoriteList()

        let favoriteIds = Set(favoriteItems.map(\.id))

        items = items.map { item in
            var updated = item
            updated.favorite = favoriteIds.contains(item.id)
            return updated
        }
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
    
    func onFavoriteTapped(itemId: Int) {
        if favoriteItems.first(where: { $0.id == itemId }) != nil {
            switch removeFavoriteUseCase.romveItemBy(itemId: itemId) {
                case .success:
                loadFavoritePokemons()
            case .failure(let error):
                print("Error removing favorite pokemon:", error)
            }
        } else {
            guard let item = items.first(where: { $0.id == itemId }) else { return }
            let favorite = FavoritePokemonItem(id: item.id, name: item.name, imageURL: item.imageURL)
            switch storeFavoriteUseCase.store(item: favorite) {
                case .success:
                loadFavoritePokemons()
            case .failure(let error):
                print("Error adding favorite pokemon:", error)
            }
        }
    }
}
