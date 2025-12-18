struct PokemonDetailDTO: Decodable {
    let id: Int
    let name: String
    let weight: Int
    let height: Int
    let sprites: PokemonSpritesDTO
    let types: [PokemonTypeSlotDTO]
    let stats: [PokemonStatDTO]
    let abilities: [PokemonAbilitySlotDTO]
}
