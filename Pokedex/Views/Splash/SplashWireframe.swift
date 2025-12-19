import SwiftData

struct SplashWireframe {

    static func createModule(
        modelContext: ModelContext,
        isSessionActive: @escaping (Bool) -> Void
    ) -> SplashView {
        
        let storage = LocalStorageManager(context: modelContext)
        let checkSessionUseCase = CheckSession(localStorageManager: storage)
        
        let viewModel = SplashViewModel(checkSessionUseCase: checkSessionUseCase, onCheckSession: isSessionActive)
        
        return SplashView(viewModel: viewModel)
    }
}
