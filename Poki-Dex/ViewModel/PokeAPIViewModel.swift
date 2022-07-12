//
//  PokeAPIViewModel.swift
//  Poki-Dex
//
//  Created by Roshan Mykoo on 7/12/22.
//

import Foundation
import SwiftUI

class PokeAPIViewModel: ObservableObject {
    @Published var pokemons: [BasicPokemon] = []
    
    func fetchPokemonList() {
        let urlString = "https://pokeapi.co/api/v2/pokemon?limit=10000&offset=0"
        
        guard let url = URL(string: urlString) else {
            return
        }
        print("CALLING API")
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            //Convert to JSON
            print("STARTING JSON CONVERSION")
            //print("DATA = \(data)")
            do {
                let results = try JSONDecoder().decode(Results.self, from: data)
                
                //print("RESULTS = \(results)")
                for result in results.results {
                    DispatchQueue.main.async {
                        self?.pokemons.append(result)
                    }
                }
            } catch {
                print("THERE WAS AN ERROR")
                print(error)
            }
        }
        task.resume()
        print("END OF API")
    }
    
    func fetchPokemonData(pokeAPIURL: String){
        let urlString = pokeAPIURL
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Convert to JSON
            do {
                let results = try JSONDecoder().decode(Pokemon.self, from: data)
                print("RESULTS = \(results)")
            } catch {
                print("THERE WAS AN ERROR")
                print(error)
            }
            
        }
        task.resume()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func fetch() {
        let urlString = "https://pokeapi.co/api/v2/pokemon/1/"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Convert to JSON
            do {
                
            } catch {
                print(error)
            }
            
        }
        
    }
    
}

