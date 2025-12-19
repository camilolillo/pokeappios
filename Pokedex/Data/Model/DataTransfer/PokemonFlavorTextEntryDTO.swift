struct PokemonFlavorTextEntryDTO: Decodable {
    let flavorText: String
    let language: PokemonNamedResourceDTO

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
    }
}
