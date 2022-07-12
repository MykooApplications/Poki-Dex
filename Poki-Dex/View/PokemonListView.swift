//
//  PokemonListView.swift
//  Poki-Dex
//
//  Created by Roshan Mykoo on 7/12/22.
//

import Foundation
import SwiftUI

struct PokemonListView: View {
    @StateObject var pokeViewModel = PokeAPIViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(pokeViewModel.pokemons, id: \.self){ pokemon in
                    NavigationLink(destination: PokemonDetailsView(pokemon: pokemon)){ Text(pokemon.name)}
                }
            }
            .navigationTitle("Pokemon")
            .onAppear {
                pokeViewModel.fetchPokemonList()
            }
            
        }
    }
    
}
