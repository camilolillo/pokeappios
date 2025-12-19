import Foundation

protocol ListPokemonsProtocol {
    func execute(limit: Int, offset: Int) async throws -> [PokemonItem]
}

final class ListPokemons {

    private let service: PokemonServiceProtocol

    init(service: PokemonServiceProtocol) {
        self.service = service
    }
}

private extension ListPokemons {
    static func extractID(from urlString: String) -> Int? {
        urlString
            .split(separator: "/")
            .compactMap { Int($0) }
            .last
    }

    static func buildImageURL(from id: Int) -> URL? {
        URL(string:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
        )
    }
}

extension ListPokemons: ListPokemonsProtocol {
    func execute(limit: Int, offset: Int) async throws -> [PokemonItem] {
        let response = try await service.fetchPokemonList(limit: limit, offset: offset)

        return response.results.compactMap { reference in
            guard
                let id = Self.extractID(from: reference.url),
                let imageURL = Self.buildImageURL(from: id)
            else {
                return nil
            }

            return PokemonItem(
                id: id,
                name: reference.name.capitalized,
                imageURL: imageURL
            )
        }
    }
}
