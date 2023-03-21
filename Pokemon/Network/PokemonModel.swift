//
//  PokemonModel.swift
//  Pokemon
//
//  Created by Güney Köse on 21.03.2023.
//

import Foundation

struct PokemonModel: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Pokemon]?
}

struct Pokemon: Codable {
    let name: String?
    let url: String?
    var image: String? //Custom
    var abilities: [Abilities]? //Custom
}

struct PokemonDetails: Codable {
    let sprites: Sprites?
    let abilities: [Abilities]?
}

struct Sprites: Codable {
    let front_shiny: String?
}

struct Abilities: Codable {
    let ability: AbilityDetail?
}

struct AbilityDetail: Codable {
    let name: String?
}




