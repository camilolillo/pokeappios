struct PokemonSpeciesDTO: Decodable {
    let flavorTextEntries: [PokemonFlavorTextEntryDTO]

    enum CodingKeys: String, CodingKey {
        case flavorTextEntries = "flavor_text_entries"
    }
}
