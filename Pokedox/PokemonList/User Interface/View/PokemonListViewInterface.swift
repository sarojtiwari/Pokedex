//
//  PokemonListViewInterface.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//
//

protocol PokemonListViewInterface: AnyObject {
    func reloadData(withData: PokemonList, pageNo: Int)
    func gotError(error: Error)
}
