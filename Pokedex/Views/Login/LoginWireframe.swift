import SwiftData

struct LoginWireframe {

    static func createModule(
        modelContext: ModelContext,
        onLoginSuccess: @escaping () -> Void
    ) -> LoginView {

        let loginService: LoginServiceProtocol = LoginService()
        let storage: LocalStorageManagerProtocol = LocalStorageManager(context: modelContext)

        let useCase: LoginUserProtocol = LoginUser(loginService: loginService, localStorageManager: storage)
        let viewModel = LoginViewModel(loginUserUseCase: useCase, onLoginSuccess: onLoginSuccess)

        return LoginView(viewModel: viewModel)
    }
}
