//
//  EndPoint.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//

import Foundation

public enum EndPoint {
    case pokemon(page: Int, limit:Int?)
    case pokemonDetail(id: Int)
    
    var path: String {
        switch self {
            // The blank is supposed to be page
        case .pokemon(let page, let limit):
            return "https://pokeapi.co/api/v2/pokemon/?offset=\(page)&limit=\(limit ?? 20)"
        case .pokemonDetail(let id):
            return "https://pokeapi.co/api/v2/pokemon/\(id)/"
        }
    }
   
}
