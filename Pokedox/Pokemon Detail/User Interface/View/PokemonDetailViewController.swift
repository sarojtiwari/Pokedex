//
//  PokemonDetailViewController.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    // MARK: -  Properties
    var presenter: PokemonDetailModuleInterface?
    
    // MARK: IBOutlets
    @IBOutlet weak var displayView: UIView! {
        didSet {
            displayView.layer.cornerRadius = 30
            displayView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var labelStackView: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    // MARK: -  VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.view.backgroundColor = .clear
        self.presenter?.getPokemon()
    }
    // MARK: IBActions
    
    // MARK: -  Other Functions
    @objc private func viewTapped() {
        self.dismiss(animated: true)
    }
    
    private func setup() {
        self.outerView.isUserInteractionEnabled = true
        outerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped)))
        labelStackView.isHidden = true
        imageView.isHidden = true
        activityIndicatorView.startAnimating()
    }
    
    private func setupData(data: PokeMonViewModel){
        self.activityIndicatorView.stopAnimating()
        self.activityIndicatorView.isHidden = true
        labelStackView.isHidden = false
        imageView.isHidden = false
        self.nameLabel.text = data.name
        self.weightLabel.text = data.weight
        self.heightLabel.text = data.height
        self.imageView.image = UIImage(data: data.data)
        
    }
}

// MARK: - PokemonDetailViewInterface
extension PokemonDetailViewController: PokemonDetailViewInterface {
    func gotDetail(pokemon: PokeMonViewModel) {
        DispatchQueue.main.async {
            self.setupData(data: pokemon)
        }
    }
    func alertError(error: Error) {
        let alertController = UIAlertController(title: "Error Detected", message: "\(error.localizedDescription)", preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
