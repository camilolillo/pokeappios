protocol StoreFavoriteProtocol {
    func store(item: FavoritePokemonItem) -> Result<Void, LocalStorageError>
}

final class StoreFavorite: StoreFavoriteProtocol {

    private let localStorageManager: LocalStorageManagerProtocol

    init(localStorageManager: LocalStorageManagerProtocol) {
        self.localStorageManager = localStorageManager
    }

    func store(item: FavoritePokemonItem) -> Result<Void, LocalStorageError> {
        localStorageManager.saveFavorite(item)
    }
}
