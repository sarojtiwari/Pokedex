//
//  PokemonListModuleInterface.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//
//

protocol PokemonListModuleInterface: AnyObject {
    func getPokemon()
    func gotoDetail(id: Int)
}
