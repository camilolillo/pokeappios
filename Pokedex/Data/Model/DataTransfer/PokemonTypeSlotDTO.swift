struct PokemonTypeSlotDTO: Decodable {
    let slot: Int
    let type: PokemonNamedResourceDTO
}
