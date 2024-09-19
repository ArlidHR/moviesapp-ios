//
//  ListMoviesRouter.swift
//  MoviesApp
//
//  Created by Arlid Henao Rueda on 17/09/24.
//

import Foundation
import UIKit

class ListMoviesRouter: MoviesViewWireFrame {
    
    weak var viewController: ListMoviesViewController?
    
    static func assembleModule() -> UIViewController {

        let viewController: ListMoviesViewController = UIStoryboard(
            name: "ListMovies",
            bundle: nil
        ).instantiateInitialViewController() as! ListMoviesViewController
        let presenter = ListMoviesPresenter()
        let interactor = ListMoviesInteractor()
        let router = ListMoviesRouter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
