//
//  PokemonList.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//

import Foundation

struct PokemonList: Codable {
    let count: Int
    var results: [Results]
}

struct Results: Codable {
    let name: String
}
