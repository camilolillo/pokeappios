import Foundation

struct PokemonItemRowDataModel: Identifiable {
    let id: Int
    let name: String
    let idText: String
    let imageURL: URL

    init(item: PokemonItem) {
        self.id = item.id
        self.name = item.name
        self.idText = String(format: "#%03d", item.id)
        self.imageURL = item.imageURL
    }
}
