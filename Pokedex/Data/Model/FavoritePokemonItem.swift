import Foundation
import SwiftData

@Model
final class FavoritePokemonItem {

    @Attribute(.unique) var id: Int
    var name: String
    var imageURL: URL

    init(id: Int, name: String, imageURL: URL) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
    }
}
