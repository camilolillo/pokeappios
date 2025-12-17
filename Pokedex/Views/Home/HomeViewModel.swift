import Combine

final class HomeViewModel: ObservableObject {
    private let onSignOut: () -> Void
    
    init(onSignOut: @escaping () -> Void) {
        self.onSignOut = onSignOut
    }
}
