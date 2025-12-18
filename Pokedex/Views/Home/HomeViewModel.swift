import Combine

final class HomeViewModel: ObservableObject {
    private let signOutUseCase: SignOutUseCaseProtocol
    private let listPokemonsUseCase: ListPokemonsProtocol
    private let onSignOut: () -> Void
    
    init(signOutUseCase: SignOutUseCaseProtocol, listPokemonsUseCase: ListPokemonsProtocol, onSignOut: @escaping () -> Void) {
        self.signOutUseCase = signOutUseCase
        self.onSignOut = onSignOut
        self.listPokemonsUseCase = listPokemonsUseCase
    }
}

extension HomeViewModel {
    func onAppear() async {
        do {
            let pokemons = try await listPokemonsUseCase.execute(limit: 20, offset: 0)
            print(pokemons)
        } catch {
            print("Error loading pokemons:", error)
        }
    }
}

extension HomeViewModel {
    func onSignOutButtonPressed() {
        signOutUseCase.signOut { _ in
            self.onSignOut()
        }
    }
}
