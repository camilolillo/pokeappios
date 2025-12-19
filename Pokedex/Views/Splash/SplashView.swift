import SwiftUI

struct SplashView: View {

    @StateObject var viewModel: SplashViewModel

    var body: some View {
        ZStack {
            Color.primaryColor
                .ignoresSafeArea()
            IsoLogo()
        }
        .onAppear() {
            viewModel.onAppear()
        }
    }
}
