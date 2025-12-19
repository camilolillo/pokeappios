protocol SignOutUseCaseProtocol {
    func signOut(completion: @escaping (Bool) -> Void)
}

struct SignOutUseCase {
    var localStorageManager: LocalStorageManagerProtocol
}

extension SignOutUseCase: SignOutUseCaseProtocol {
    func signOut(completion: @escaping (Bool) -> Void) {
        _ = localStorageManager.clearSession()
        completion(true)
    }
}
