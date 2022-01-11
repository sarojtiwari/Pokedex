//
//  PokemonListServiceType.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//
//

import Foundation

protocol PokemonListServiceType: AnyObject {
    func getPokemon(offSet: Int, success: @escaping(PokemonList) -> (), failure: @escaping(Error) -> ())
}

extension PokemonListServiceType {
    func getPokemon(offSet: Int, success: @escaping(PokemonList) -> (), failure: @escaping(Error) -> ()) {
        let url = URL(string: EndPoint.pokemon(page: offSet, limit: nil).path)!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {return failure(error!)}
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(PokemonList.self, from: data)
                    success(result)
                } catch let error {
                    failure(error)
                }
            }
            
        }.resume()
    }
}
