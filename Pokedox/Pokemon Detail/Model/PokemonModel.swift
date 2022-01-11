//
//  PokemonModel.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//

import Foundation

struct PokemonModel: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let imageURL: URL
    
    enum RootKeys: String, CodingKey {
        case id, weight, height, name, sprites
    }
    
    enum SpriteKeys: String, CodingKey {
        case front_default
    }
    
    enum FormKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootKeys.self)
        id = try rootContainer.decode(Int.self, forKey: .id)
        height = try rootContainer.decode(Int.self, forKey: .height)
        weight = try rootContainer.decode(Int.self, forKey: .weight)
        name = try rootContainer.decode(String.self, forKey: .name)
        
        let spriteContainer = try rootContainer.nestedContainer(keyedBy: SpriteKeys.self, forKey: .sprites)
        let string = try spriteContainer.decode(String.self, forKey: .front_default)
        // Assuming the API always returns value
        self.imageURL = URL(string: string)!
        
    }
}
