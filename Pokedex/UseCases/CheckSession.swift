protocol CheckSessionProtocol {
    func isSessionActive() -> Bool
}

struct CheckSession: CheckSessionProtocol {
    var localStorageManager: LocalStorageManagerProtocol
    
    func isSessionActive() -> Bool {
        let result = localStorageManager.fetchSession()
        switch result {
        case .success(let session):
            return session?.isLoggedIn == true
        case .failure:
            return false
        }
    }
}
