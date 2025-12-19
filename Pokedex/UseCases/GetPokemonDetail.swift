import Foundation

protocol GetPokemonDetailProtocol {
    func getPokemonBy(id: Int) async throws -> Pokemon
}

struct GetPokemonDetail {
    private let service: PokemonServiceProtocol

    init(service: PokemonServiceProtocol) {
        self.service = service
    }
}

extension GetPokemonDetail: GetPokemonDetailProtocol {
    func getPokemonBy(id: Int) async throws -> Pokemon {

        async let pokemonDTO = service.fetchPokemonDetail(id: id)
        async let speciesDTO = service.fetchPokemonSpecies(id: id)

        let (detail, species) = try await (pokemonDTO, speciesDTO)

        let description = species.flavorTextEntries
            .first { $0.language.name == "en" }?
            .flavorText
            .replacingOccurrences(of: "\n", with: " ")
            .replacingOccurrences(of: "\u{000C}", with: " ")
            ?? ""

        let imageURL = URL(
            string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(detail.id).png"
        )!

        let types = detail.types.map {
            PokemonType(name: $0.type.name)
        }

        let stats = detail.stats.map {
            PokemonStat(
                name: $0.stat.name,
                value: $0.baseStat
            )
        }

        let moves = detail.abilities.map {
            $0.ability.name
        }

        return Pokemon(
            id: detail.id,
            name: detail.name.capitalized,
            imageURL: imageURL,
            types: types,
            weight: detail.weight,
            height: detail.height,
            moves: moves,
            description: description,
            stats: stats
        )
    }
}

