//
//  ListMoviesPresenter.swift
//  MoviesApp
//
//  Created by Arlid Henao Rueda on 17/09/24.
//

import Foundation

class ListMoviesPresenter: MoviesViewPresentationLogic {
    
    var viewController: MoviesViewDisplayLogic?
    
    func presentListMovies(movies: [PopularMovieEntity]) {
        let viewModel = movies.compactMap {
            PopularMovieEntity.init(
                id: $0.id,
                title:  $0.title,
                overview: $0.overview,
                imageURL: $0.imageURL != nil ? URL(string: $0.imageURL!.absoluteString) : nil,
                votes: $0.votes
            )
        }
            
        if viewModel.count > 0 {
            viewController?.displayListMovies(viewModel: viewModel)
        } else {
            viewController?.displayListEmptyMovies(text: "No hay peliculas para mostrar", sizeTitle: 16)
        }
    }
    
    func presentServiceError() {
        viewController?.displayListEmptyMovies(text: "Tenemos Problemas de conexion \nintenta nuevamente", sizeTitle: 16)
    }
}
