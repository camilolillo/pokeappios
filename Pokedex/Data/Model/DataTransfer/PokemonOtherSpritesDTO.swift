
struct PokemonOtherSpritesDTO: Decodable {
    let officialArtwork: PokemonArtworkDTO

    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}
