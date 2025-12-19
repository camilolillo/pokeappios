import SwiftUI

struct PokemonItemRowView: View {

    let dataModel: PokemonItemRowDataModel

    var body: some View {
        HStack(){
            AsyncImage(url: dataModel.imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 72, height: 72)
            Spacer()
            VStack(alignment: .trailing) {
                Text(dataModel.idText)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                Text(dataModel.name)
                    .font(.headline)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(12)
    }
}
