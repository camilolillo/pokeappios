import Combine

final class HomeViewModel: ObservableObject {
    private let onSignOut: () -> Void
    private let signOutUseCase: SignOutUseCaseProtocol
    
    init(signOutUseCase: SignOutUseCaseProtocol, onSignOut: @escaping () -> Void) {
        self.signOutUseCase = signOutUseCase
        self.onSignOut = onSignOut
    }
}

extension HomeViewModel {
    func onSignOutButtonPressed() {
        signOutUseCase.signOut { _ in
            self.onSignOut()
        }
    }
}
