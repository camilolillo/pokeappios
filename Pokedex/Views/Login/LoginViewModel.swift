import Combine

final class LoginViewModel: ObservableObject {
    
    private let onLoginSuccess: () -> Void
    private let loginUserUseCase: LoginUserProtocol
    
    @Published var alertState: AlertState?
    
    init(loginUserUseCase: LoginUserProtocol, onLoginSuccess: @escaping () -> Void) {
        self.onLoginSuccess = onLoginSuccess
        self.loginUserUseCase = loginUserUseCase
    }
}

extension LoginViewModel {
    func onLoginButtonPressed(userName: String, password: String) {
        guard !userName.isEmpty && !password.isEmpty else {
            alertState = AlertState(title: "Error", message: "Debes ingresar datos válidos")
            return
        }
        loginUserUseCase.execute(userName: userName, password: password) { success in
            if success {
                self.onLoginSuccess()
            } else {
                self.alertState = AlertState(title: "Error", message: "Hubo un error con el inicio de sesión")
            }
        }
    }
    func onAlertButtonPressed() {
        alertState = nil
    }
}
