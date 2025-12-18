import SwiftUI

enum AppRoute {
    case splash
    case login
    case home
}

struct RootView: View {
    @State private var route: AppRoute = .splash
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationView {
            switch route {
            case .splash:
                SplashWireframe.createModule(modelContext: modelContext) { isSessionActive in
                    route = isSessionActive ? .home : .login
                }
            case .login:
                LoginWireframe.createModule(modelContext: modelContext) {
                    route = .home
                }
            case .home:
                HomeWireframe.createModule(modelContext: modelContext) {
                    route = .splash
                }
            }
        }
    }
}
