import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack (spacing: 12) {
                Text("HOME")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        }
    }
}
