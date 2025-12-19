protocol ListFavoritePokemonsProtocol {
    func getFavoriteList() -> [FavoritePokemonItem]
}

final class ListFavoritePokemons {

    private let localStorageManager: LocalStorageManagerProtocol

    init(localStorageManager: LocalStorageManagerProtocol) {
        self.localStorageManager = localStorageManager
    }
}

extension ListFavoritePokemons: ListFavoritePokemonsProtocol {
    func getFavoriteList() -> [FavoritePokemonItem] {
        switch localStorageManager.fetchFavorites() {
        case .success(let items):
            return items
        case .failure:
            return []
        }
    }
}
