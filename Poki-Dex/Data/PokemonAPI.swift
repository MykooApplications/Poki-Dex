//
//  PokemonAPI.swift
//  Poki-Dex
//
//  Created by Roshan Mykoo on 3/24/22.
//

import Foundation
import SwiftUI

class PokemonAPI {
    @Published var pokeData : [PokemonData] = []
    
    
    // MARK: - Pokemon API Getters
    func getAllPokemons() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=1200&offset=0") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print("API Failed")
                return
            }
            do {
                let pokes = try JSONDecoder().decode(PokemonData.self, from: data)
//                print("POKE API DATA = \(pokes.results)")
                print("pokemon = \(pokes.results[0].name)  & url = \(pokes.results[0].url)")
//                let pokeURL = pokes.results[0].url
//                self?.getPokemonDataFromID(pokemonURL: pokeURL)
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    
//    func getPokemonDataFromID(pokemonURL pUrl: String) {
//        guard let url = URL(string: pUrl) else { return }
//        let task = URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data, error == nil else {
//                print("API FAILED")
//                return
//            }
//            do {
//                let pokemonData = try JSONDecoder().decode(Pokemon.self, from: data)
//                print("got the pokemon data = \(pokemonData)")
//            }
//            catch {
//                print(error)
//            }
//        }
//        task.resume()
//    }

}

// MARK: - Encode/decode helpers
class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
