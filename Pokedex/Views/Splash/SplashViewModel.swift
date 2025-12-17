import Combine

final class SplashViewModel: ObservableObject {

    private let onCheckSession: (Bool) -> Void
    
    init(onCheckSession: @escaping (Bool) -> Void) {
        self.onCheckSession = onCheckSession
    }

    func onAppear() {
        checkSession()
    }

    private func checkSession() {
        onCheckSession(false)
    }
}
