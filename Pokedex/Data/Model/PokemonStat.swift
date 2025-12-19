struct PokemonStat {
    let name: String
    let value: Int
}

extension PokemonStat: Identifiable {
    var id: String {
        name
    }
}
