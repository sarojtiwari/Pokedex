//
//  PokemonDetailInteractorIO.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//
//
import Foundation

protocol PokemonDetailInteractorInput: AnyObject {
    func getPokemon()
    func getImageData(url: URL)

}

protocol PokemonDetailInteractorOutput: AnyObject {
    func gotPokemon(pokemon: PokemonModel)
    func gotData(data: Data)
    func gotError(error: Error)
}
