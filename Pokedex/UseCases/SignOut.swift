protocol SignOutUseCaseProtocol {
    func signOut(completion: @escaping (Bool) -> Void)
}

struct SignOutUseCase: SignOutUseCaseProtocol {
    var localStorageManager: LocalStorageManagerProtocol
    
    func signOut(completion: @escaping (Bool) -> Void) {
        _ = localStorageManager.clearSession()
        completion(true)
    }
}
