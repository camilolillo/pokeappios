struct SplashWireframe {

    static func createModule(
        isSessionActive: @escaping (Bool) -> Void
    ) -> SplashView {
        
        let storage = LocalStorageManager.shared
        let checkSessionUseCase = CheckSession(localStorageManager: storage)
        
        let viewModel = SplashViewModel(checkSessionUseCase: checkSessionUseCase, onCheckSession: isSessionActive)
        
        return SplashView(viewModel: viewModel)
    }
}
