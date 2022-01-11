//
//  PokemonDetailInteractor.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//
//

import Foundation

class PokemonDetailInteractor {
	// MARK: - Properties
    weak var output: PokemonDetailInteractorOutput?
    private let service: PokemonDetailServiceType
    var id: Int?
    
    // MARK: -  Initialization
    init(service: PokemonDetailServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: - PokemonDetail interactor input interface
extension PokemonDetailInteractor: PokemonDetailInteractorInput {
    func getPokemon() {
        guard id != nil else {return}
        service.getPokemon(id: id!) { [weak self] pokemon in
            guard let self = self else {return}
            self.output?.gotPokemon(pokemon: pokemon)
        } failure: { [weak self] error in
            guard let self = self else {return}
            self.output?.gotError(error: error)
        }
    }
    
    func getImageData(url: URL) {
        service.downloadImage(url: url) {[weak self] data in
            guard let self = self else {return}
            self.output?.gotData(data: data)
        } failure: { [weak self] error in
            guard let self = self else {return}
            self.output?.gotError(error: error)
        }
    }
}
