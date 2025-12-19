import Foundation

protocol PokemonServiceProtocol {
    func fetchPokemonList(limit: Int, offset: Int) async throws -> PokemonListResponseDTO
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailDTO
    func fetchPokemonSpecies(id: Int) async throws -> PokemonSpeciesDTO
}

final class PokemonService {

    private let client: NetworkClient
    private let baseURL = "https://pokeapi.co/api/v2"

    init(client: NetworkClient = .shared) {
        self.client = client
    }
}

extension PokemonService: PokemonServiceProtocol {
    func fetchPokemonList(limit: Int, offset: Int) async throws -> PokemonListResponseDTO {
        guard let url = URL(string: "\(baseURL)/pokemon?limit=\(limit)&offset=\(offset)") else {
            throw NetworkError.invalidURL
        }

        return try await client.request(url)
    }

    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailDTO {
        guard let url = URL(string: "\(baseURL)/pokemon/\(id)") else {
            throw NetworkError.invalidURL
        }

        return try await client.request(url)
    }
    
    func fetchPokemonSpecies(id: Int) async throws -> PokemonSpeciesDTO {
        guard let url = URL(string: "\(baseURL)/pokemon-species/\(id)") else {
            throw NetworkError.invalidURL
        }

        return try await client.request(url)
    }
}
