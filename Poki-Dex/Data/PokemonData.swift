//
//  PokemonData.swift
//  Poki-Dex
//
//  Created by Roshan Mykoo on 3/24/22.
//

import Foundation

struct PokemonData :  Codable {
    var count: Int
    var next: String?
    var previous: JSONNull?
    var results : [PokemonResult]
}

struct PokemonResult: Codable {
    var name : String
    var url: String
}

struct Pokemon: Codable {
    var baseExperience: Int
    var height: Int
    var id: Int
    var isDefault: Bool
    var locationAreaEncounters: String
    var name: String
    var order: Int
    var species: Species
    var types: [TypeElement]
    var weight: Int

    enum CodingKeys: String, CodingKey {
        case baseExperience = "base_experience"
        case height, id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case name, order, species, types, weight
    }
}

// MARK: - Species
struct Species: Codable {
    var name: String
    var url: String
}

// MARK: - TypeElement
struct TypeElement: Codable {
    var slot: Int
    var type: Species
}

