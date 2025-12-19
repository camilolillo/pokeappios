import Combine

final class SplashViewModel: ObservableObject {

    private let checkSessionUseCase: CheckSessionProtocol
    private let onCheckSession: (Bool) -> Void
    
    init(checkSessionUseCase: CheckSessionProtocol, onCheckSession: @escaping (Bool) -> Void) {
        self.onCheckSession = onCheckSession
        self.checkSessionUseCase = checkSessionUseCase
    }
}

extension SplashViewModel {
    func onAppear() {
        checkSession()
    }
}

extension SplashViewModel {
    private func checkSession() {
        onCheckSession(checkSessionUseCase.isSessionActive())
    }
}
