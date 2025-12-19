enum LoginServiceError: Error {
    case invalidCredentials
}

protocol LoginServiceProtocol {
    func login(userName: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}

struct LoginService: LoginServiceProtocol {
    private let validUsername = "admin"
    private let validPassword = "1234"

    func login(userName: String, password: String, completion: @escaping (Result<Void, any Error>) -> Void) {
        if userName == validUsername && password == validPassword {
            completion(.success(()))
        } else {
            completion(.failure(LoginServiceError.invalidCredentials))
        }
    }
}
