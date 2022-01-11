//
//  PokemonDetailPresenter.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//
//

import Foundation

class PokemonDetailPresenter {
    
	// MARK: - Properties
    weak var view: PokemonDetailViewInterface?
    var interactor: PokemonDetailInteractorInput?
    var wireframe: PokemonDetailWireframeInput?

    var pokemonModel: PokemonModel?
    
    // MARK: Converting entities
    private func convert(_ model: PokemonModel, data: Data) -> PokeMonViewModel{
        return PokeMonViewModel(name: model.name, weight: String("\(Float(model.weight*100)) grams"), height: String("\(Float(model.height/10)) meters"), data: data)
    }
}

 // MARK: - PokemonDetail module interface
extension PokemonDetailPresenter: PokemonDetailModuleInterface {
    func getPokemon() {
        interactor?.getPokemon()
    }
}

// MARK: -  PokemonDetail interactor output interface
extension PokemonDetailPresenter: PokemonDetailInteractorOutput {
    
    func gotData(data: Data) {
        guard pokemonModel != nil else {return}
        let pokemonViewModel = self.convert(pokemonModel!, data: data)
        view?.gotDetail(pokemon: pokemonViewModel)
    }
    
    func gotError(error: Error) {
        self.view?.alertError(error: error)
    }
    
    func gotPokemon(pokemon: PokemonModel) {
        self.pokemonModel = pokemon
        interactor?.getImageData(url: pokemon.imageURL)
    }

}
