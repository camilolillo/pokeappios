import SwiftUI

enum AppRoute {
    case splash
    case login
    case home
}

struct RootView: View {
    @State private var route: AppRoute = .splash
    var body: some View {
        NavigationView {
            switch route {
            case .splash:
                SplashView(viewModel: SplashViewModel { isSessionActive in
                        route = isSessionActive ? .home : .login
                    }
                )
            case .login:
                LoginView(viewModel: LoginViewModel { route = .home })
            case .home:
                HomeView(viewModel: HomeViewModel { route = .splash })
            }
        }
    }
}
