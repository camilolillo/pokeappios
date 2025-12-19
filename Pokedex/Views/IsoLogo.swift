import SwiftUI

struct IsoLogo: View {
    var body: some View {
        VStack(spacing: 12) {
            HStack(alignment: .center) {
                Image("pokeball")
                Image("pokedex")
            }
        }
    }
}
