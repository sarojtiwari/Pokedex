//
//  PokemonListActivityIndicatorCell.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//

import UIKit

class PokemonListActivityIndicatorCell: UITableViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    static func returnNIB() -> UINib {
        return UINib(nibName: "PokemonListActivityIndicatorCell", bundle: nil)
    }
    static func returnReuseIdentifier() -> String {
        return "pokemonlistactivityindicatorcell"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
