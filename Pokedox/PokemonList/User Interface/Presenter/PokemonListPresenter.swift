//
//  PokemonListPresenter.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//
//

import Foundation

class PokemonListPresenter {
    
	// MARK: - Properties
    var page: Int = 0
    weak var view: PokemonListViewInterface?
    var interactor: PokemonListInteractorInput?
    var wireframe: PokemonListWireframeInput?

}

 // MARK: -  PokemonList module interface
extension PokemonListPresenter: PokemonListModuleInterface {
    func getPokemon() {
        interactor?.getData(offSet: page)
    }
    func gotoDetail(id: Int) {
        wireframe?.gotoDetail(id: id)
    }
}

// MARK: - PokemonList interactor output interface
extension PokemonListPresenter: PokemonListInteractorOutput {
    func gotError(error: Error) {
        view?.gotError(error: error)
    }
    
    func gotPokemon(pokemon: PokemonList) {
        if pokemon.count != page {
            page += 20
        }
        view?.reloadData(withData: pokemon, pageNo: page)
    }
    
    
}
