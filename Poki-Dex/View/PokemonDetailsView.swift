//
//  PokemonDetailsView.swift
//  Poki-Dex
//
//  Created by Roshan Mykoo on 7/12/22.
//

import Foundation
import SwiftUI

struct PokemonDetailsView: View {
    @StateObject var pokeViewModel = PokeAPIViewModel()

    var pokemon: BasicPokemon
    
    var body: some View {
        Text("Name: \(pokemon.name)")
            .onAppear{
                pokeViewModel.fetchPokemonData(pokeAPIURL: pokemon.url)
            }
    }
}
