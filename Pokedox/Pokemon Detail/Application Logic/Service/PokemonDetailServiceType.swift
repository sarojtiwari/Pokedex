//
//  PokemonDetailServiceType.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//
//

import Foundation

protocol PokemonDetailServiceType: AnyObject {
    func getPokemon(id: Int, success: @escaping(PokemonModel) -> (), failure: @escaping(Error) -> ())
    func downloadImage(url: URL, success: @escaping(Data) -> (), failure: @escaping(Error) -> ())
}

extension PokemonDetailServiceType {
    func getPokemon(id: Int, success: @escaping(PokemonModel) -> (), failure: @escaping(Error) -> ()) {
        let url = URL(string: EndPoint.pokemonDetail(id: id).path)!
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard error == nil else {return failure(error!)}
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(PokemonModel.self, from: data)
                    success(result)
                } catch let error {
                    failure(error)
                }
            }
        }.resume()
    }
    
    func downloadImage(url: URL, success: @escaping(Data) -> (), failure: @escaping(Error) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {return failure(error!)}
            if let data = data {
                success(data)
            }
        }.resume()
    }
}
