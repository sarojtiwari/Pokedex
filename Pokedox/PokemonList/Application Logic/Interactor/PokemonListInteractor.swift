//
//  PokemonListInteractor.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//
//

import Foundation

class PokemonListInteractor {
    
	// MARK: -  Properties
    weak var output: PokemonListInteractorOutput?
    private let service: PokemonListServiceType
    
    // MARK: -  Initialization
    
    init(service: PokemonListServiceType) {
        self.service = service
    }

}

// MARK: PokemonList interactor input interface

extension PokemonListInteractor: PokemonListInteractorInput {
    func getData(offSet: Int) {
        service.getPokemon(offSet: offSet) { [weak self] pokemonList in
            guard let self = self else {return}
            self.output?.gotPokemon(pokemon: pokemonList)
        } failure: { error in
            self.output?.gotError(error: error)
        }

    }
    
    
}
