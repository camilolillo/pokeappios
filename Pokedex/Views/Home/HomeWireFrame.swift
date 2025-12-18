import SwiftData

struct HomeWireframe {
    
    static func createModule(
        modelContext: ModelContext,
        onSignOut: @escaping () -> Void
    ) -> HomeView {
        let localStorageManager = LocalStorageManager(context: modelContext)
        let signOutUseCase = SignOutUseCase(localStorageManager: localStorageManager)
        
        let viewModel = HomeViewModel(signOutUseCase: signOutUseCase, onSignOut: onSignOut)
        
        return HomeView(viewModel: viewModel)
    }
}
