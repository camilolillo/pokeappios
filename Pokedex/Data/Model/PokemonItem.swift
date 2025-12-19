import Foundation

struct PokemonItem: Identifiable {
    let id: Int
    let name: String
    let imageURL: URL
    var favorite: Bool = false
}
