import SwiftUI

struct PokemonItemRowView: View {

    let dataModel: PokemonItemRowDataModel
    let onFavoriteTapped: () -> Void

    var body: some View {
        HStack {
            AsyncImage(url: dataModel.imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 72, height: 72)

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Button {
                    onFavoriteTapped()
                } label: {
                    Image(systemName: dataModel.favorite ? "heart.fill" : "heart")
                        .foregroundColor(Color.primaryColor)
                }
                .buttonStyle(.plain)
                Text(dataModel.idText)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(dataModel.name)
                    .font(.headline)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(12)
    }
}
