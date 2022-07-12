//
//  Pokemon.swift
//  Poki-Dex
//
//  Created by Roshan Mykoo on 5/2/22.
//

import Foundation

struct Pokemon: Decodable {
    
    var baseExperience : Int = 0
    var height: Int = 0
    //var id : Int
    var isDefault : Bool = true
    var locationAreaEncounters: String = ""
    var name: String = ""
    var order: Int = 0
    var weight: Int = 0
    
    private enum PokemonResponseKeys : String, CodingKey {
        case abilities
        case baseExperiance = "base_experience"
        case height = "height"
       // case id = "id"
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case name = "name"
        case order = "order"
        case weight = "weight"
        case pastTypes = "past_types"
        
    }
    
    /*
     abilities[]
     forms[]
     game_indices[]
     held_items []
     moves[]
     past_types[]
     species[]
     sprites[]
     stats[]
     types[]
     */
    
    private enum AbilitiesKeys: String, CodingKey {
        case slot
        case isHidden
        case ability
    }
    
    init(from decoder: Decoder) throws {
        if let pokemonResponseContainer = try? decoder.container(keyedBy: PokemonResponseKeys.self) {
            self.baseExperience = try pokemonResponseContainer.decode(Int.self, forKey: .baseExperiance)
            self.height = try pokemonResponseContainer.decode(Int.self, forKey: .height)
//            self.id = try pokemonResponseContainer.decode(Int.self, forKey: .id)
            self.isDefault = try pokemonResponseContainer.decode(Bool.self, forKey: .isDefault)
            self.locationAreaEncounters = try pokemonResponseContainer.decode(String.self, forKey: .locationAreaEncounters)
            self.name = try pokemonResponseContainer.decode(String.self, forKey: .name)
            self.order = try pokemonResponseContainer.decode(Int.self, forKey: .order)
            self.weight = try pokemonResponseContainer.decode(Int.self, forKey: .weight)
//            if let abilitiesContainer = try? pokemonResponseContainer.nestedContainer(keyedBy: AbilitiesKeys.self, forKey: .abilities) {
//
//            }
        }
    }
}


struct AbilitiesData: Codable {}

//struct Abilitys: Decodable {
//    var abilities = [AbilitiesData]
//}

struct BaseExperianceData: Codable {
    var baseExperiance: Int
}

struct FormsData: Codable {}

struct GameIndicesData: Codable {}

struct HeldItemsData: Codable {}

struct MovesData: Codable {}

struct PastTypesData: Codable {}

struct SpeciesData: Codable {}

struct SpritesData: Codable {}

struct statsData: Codable {}

struct typesData: Codable {}

