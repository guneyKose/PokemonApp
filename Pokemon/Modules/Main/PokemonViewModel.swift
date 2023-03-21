//
//  PokemonViewModel.swift
//  Pokemon
//
//  Created by Güney Köse on 21.03.2023.
//

import Foundation
import UIKit

final class PokemonViewModel {
    
    private var baseURLString = "https://pokeapi.co/api/v2/pokemon/"
    private var nextURLString = ""
    let title = "Pokemons"
    let toDetailSegue = "toPokemonDetail"
    lazy var pokemons: [Pokemon] = []
    var selectedPokemon: Pokemon?
    let nib = UINib(nibName: PokemonTableViewCell.id, bundle: nil)
    
    func fetchPokemon(next: Bool = false, _ completion: @escaping (Bool) -> Void) {
        let urlString = next ? nextURLString : baseURLString
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error {
                    debugPrint(error.localizedDescription)
                    completion(false)
                    return
                }
                if let data = data {
                    let decoder = JSONDecoder()
                   do {
                       let decodedData = try decoder.decode(PokemonModel.self, from: data)
                       self.nextURLString = decodedData.next ?? ""
                       if let pokemons = decodedData.results {
                           self.pokemons += pokemons
                           self.fetchPokemonDetails { success in
                               completion(success)
                           }
                       }
                   } catch let error {
                       debugPrint(error.localizedDescription)
                       completion(false)
                       return
                   }
                }
            }
            task.resume()
        }
    }
    
    private func fetchPokemonDetails(_ completion: @escaping (Bool) -> Void) {
        for (index, pokemon) in pokemons.enumerated() {
            if let url = URL(string: pokemon.url!) {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { data, response, error in
                    if let error {
                        debugPrint(error.localizedDescription)
                        completion(false)
                        return
                    }
                    if let data = data {
                        let decoder = JSONDecoder()
                       do {
                           let decodedData = try decoder.decode(PokemonDetails.self, from: data)
                           if let sprites = decodedData.sprites, let abilities = decodedData.abilities {
                               self.pokemons[index].image = sprites.front_shiny ?? ""
                               self.pokemons[index].abilities = abilities
                           }
                       } catch let error {
                           debugPrint(error.localizedDescription)
                           completion(false)
                           return
                       }
                    }
                }
                task.resume()
            }
        }
        completion(true)
    }
}
