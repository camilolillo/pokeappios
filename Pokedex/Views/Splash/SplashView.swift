import SwiftUI

struct SplashView: View {

    @StateObject var viewModel: SplashViewModel

    var body: some View {
        ZStack {
            Color.primaryColor
                .ignoresSafeArea()
            HStack(alignment: .center) {
                Image("pokeball")
                Image("pokedex")
            }
        }
        .onAppear() {
            viewModel.onAppear()
        }
    }
}
