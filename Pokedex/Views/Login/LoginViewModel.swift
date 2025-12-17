import Combine

final class LoginViewModel: ObservableObject {
    @Published var showEmptyFieldsAlert = false
    
    private let onLoginSuccess: () -> Void
    
    init(onLoginSuccess: @escaping () -> Void) {
        self.onLoginSuccess = onLoginSuccess
    }
}

extension LoginViewModel {
    func onLoginButtonPressed(userName: String, password: String) {
        guard !userName.isEmpty || !password.isEmpty else {
            showEmptyFieldsAlert = true
            return
        }
        print("\(userName)")
        print("\(password)")
    }
}
