import Foundation

struct Pokemon {
    let id: Int
    let name: String
    let imageURL: URL
    let types: [PokemonType]
    let weight: Int
    let height: Int
    let moves: [String]
    let description: String
    let stats: [PokemonStat]
}
