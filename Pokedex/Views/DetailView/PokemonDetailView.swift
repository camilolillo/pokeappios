import SwiftUI

struct PokemonDetailView: View {
    private let pokemon: Pokemon

    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }

    var body: some View {
        VStack(spacing: 0) {

            // MARK: - Top colored section
            VStack(spacing: 16) {
                header
                imageSection
                typesSection
            }
            .padding()
            .background(Color.primaryColor)

            // MARK: - White content section
            VStack(spacing: 24) {
                measuresSection
                aboutSection
                statsSection
            }
            .padding()
            .background(Color.white)
            .cornerRadius(24)
            .padding(.top, -20)
        }
        .ignoresSafeArea(edges: .top)
    }

    // MARK: - Header
    private var header: some View {
        HStack {
            Text(pokemon.name.capitalized)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)

            Spacer()

            Text(pokemon.idText)
                .foregroundColor(.white)
                .fontWeight(.semibold)
        }
    }

    // MARK: - Image
    private var imageSection: some View {
        ZStack {
            Color.white

            AsyncImage(url: pokemon.imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .padding(12)
            } placeholder: {
                ProgressView()
                    .tint(Color.primaryColor)
            }
        }
        .frame(width: 180, height: 180)
        .cornerRadius(12)
    }


    // MARK: - Types
    private var typesSection: some View {
        HStack(spacing: 12) {
            ForEach(pokemon.types) { type in
                Text(type.name.capitalized)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(Color.primaryColor.opacity(0.8))
                    .clipShape(Capsule())
            }
        }
    }

    // MARK: - Weight / Height
    private var measuresSection: some View {
        HStack {
            measureItem(title: "Weight", value: "\(pokemon.weight) kg")
            Spacer()
            measureItem(title: "Height", value: "\(pokemon.height) m")
        }
    }

    private func measureItem(title: String, value: String) -> some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.headline)
                .foregroundColor(Color.primaryColor)

            Text(title)
                .font(.caption)
                .foregroundColor(Color.primaryColor.opacity(0.6))
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: - About
    private var aboutSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("About")
                .font(.headline)
                .foregroundColor(Color.primaryColor)

            Text(pokemon.description)
                .foregroundColor(.black)
        }
    }

    // MARK: - Base Stats
    private var statsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Base Stats")
                .font(.headline)
                .foregroundColor(Color.primaryColor)

            ForEach(pokemon.stats) { stat in
                HStack {
                    Text(stat.name.uppercased())
                        .frame(width: 50, alignment: .leading)
                        .foregroundColor(Color.primaryColor)

                    Text(String(format: "%03d", stat.value))
                        .frame(width: 40, alignment: .trailing)
                        .foregroundColor(Color.primaryColor)

                    ProgressView(value: Float(stat.value), total: 100)
                        .tint(Color.primaryColor)
                }
            }
        }
    }
}
