//
//  PokemonData.swift
//  Poki-Dex
//
//  Created by Roshan Mykoo on 3/24/22.
//

import Foundation

struct BasicPokemon: Hashable, Codable {
    var name: String
    var url: String
}

struct Results: Codable {
    var results: [BasicPokemon]
}
