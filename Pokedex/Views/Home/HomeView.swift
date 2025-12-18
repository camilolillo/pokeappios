import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            Color.primaryColor
                .ignoresSafeArea()
            VStack (spacing: 12) {
                HStack {
                    IsoLogo()
                    Spacer()
                    signOutButton
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)
                Spacer()
            }
        }
    }
    
    private var signOutButton: some View {
        Button(action: onSignOutButtonPressed) {
            Text("Sign Out")
                .font(.headline)
                .foregroundColor(Color.white)
        }
    }
}

extension HomeView {
    func onSignOutButtonPressed() {
        viewModel.onSignOutButtonPressed()
    }
}
