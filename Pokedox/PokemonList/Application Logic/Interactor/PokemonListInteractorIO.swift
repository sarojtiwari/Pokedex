//
//  PokemonListInteractorIO.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//
//

protocol PokemonListInteractorInput: AnyObject {
    func getData(offSet: Int)
}

protocol PokemonListInteractorOutput: AnyObject {
    func gotPokemon(pokemon: PokemonList)
    func gotError(error: Error)
}
