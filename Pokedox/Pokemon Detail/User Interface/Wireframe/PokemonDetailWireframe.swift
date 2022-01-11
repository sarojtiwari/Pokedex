//
//  PokemonDetailWireframe.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//
//

import UIKit

class PokemonDetailWireframe {
     weak var view: UIViewController!
}

extension PokemonDetailWireframe: PokemonDetailWireframeInput {
    
    var storyboardName: String {return "PokemonDetail"}
    
    func getMainView() -> UIViewController {
        let service = PokemonDetailService()
        let interactor = PokemonDetailInteractor(service: service)
        let presenter = PokemonDetailPresenter()
        let viewController = viewControllerFromStoryboard(of: PokemonDetailViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
    
    func getMainView(id: Int) -> UIViewController {
        let service = PokemonDetailService()
        let interactor = PokemonDetailInteractor(service: service)
        let presenter = PokemonDetailPresenter()
        let viewController = viewControllerFromStoryboard(of: PokemonDetailViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        interactor.id = id
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
}
