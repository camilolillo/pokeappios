struct PokemonType {
    let name: String
}

extension PokemonType: Identifiable {
    var id: String {
        name
    }
}
