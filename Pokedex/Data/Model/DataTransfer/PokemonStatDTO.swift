struct PokemonStatDTO: Decodable {
    let baseStat: Int
    let stat: PokemonNamedResourceDTO

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }
}
