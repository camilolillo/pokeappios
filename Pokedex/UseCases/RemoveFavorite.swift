protocol RemoveFavoriteProtocol {
    func romveItemBy(itemId: Int) -> Result<Void, LocalStorageError>
}

final class RemoveFavorite {

    private let localStorageManager: LocalStorageManagerProtocol

    init(localStorageManager: LocalStorageManagerProtocol) {
        self.localStorageManager = localStorageManager
    }
}

extension RemoveFavorite: RemoveFavoriteProtocol {
    func romveItemBy(itemId: Int) -> Result<Void, LocalStorageError> {
        localStorageManager.removeFavorite(itemId: itemId)
    }
}
