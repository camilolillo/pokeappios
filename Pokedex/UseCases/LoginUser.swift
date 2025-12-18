protocol LoginUserProtocol {
    func execute(userName: String, password: String, completion: @escaping (Bool) -> Void)
}

struct LoginUser: LoginUserProtocol {
    var loginService: LoginServiceProtocol
    var localStorageManager: LocalStorageManagerProtocol

    func execute(userName: String, password: String, completion: @escaping (Bool) -> Void) {
        loginService.login(userName: userName, password: password) { result in
            switch result {
            case .success(_):
                _ = localStorageManager.saveSession(username: userName)
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
}
