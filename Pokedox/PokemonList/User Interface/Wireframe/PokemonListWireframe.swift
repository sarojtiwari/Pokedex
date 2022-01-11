//
//  PokemonListWireframe.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//
//

import UIKit

class PokemonListWireframe {
     weak var view: UIViewController!
}

extension PokemonListWireframe: PokemonListWireframeInput {
    
    var storyboardName: String {return "PokemonList"}
    
    func getMainView() -> UIViewController {
        let service = PokemonListService()
        let interactor = PokemonListInteractor(service: service)
        let presenter = PokemonListPresenter()
        let viewController = viewControllerFromStoryboard(of: PokemonListViewController.self)
        
        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController
        
        self.view = viewController
        return viewController
    }
    
    func gotoDetail(id: Int)  {
        let viewController = PokemonDetailWireframe().getMainView(id: id)
        viewController.modalPresentationStyle = .popover
        self.view.navigationController?.present(viewController, animated: true)
    }
}
