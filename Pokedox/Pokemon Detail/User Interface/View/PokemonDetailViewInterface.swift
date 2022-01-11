//
//  PokemonDetailViewInterface.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//
//

import Foundation

protocol PokemonDetailViewInterface: AnyObject {
    func gotDetail(pokemon: PokeMonViewModel)
    func alertError(error: Error)
}
