//
//  ListMoviesContract.swift
//  MoviesApp
//
//  Created by Arlid Henao Rueda on 17/09/24.
//

import Foundation

protocol MoviesViewBusinessLogic {
    func getMovies()
}

protocol MoviesViewPresentationLogic: AnyObject {
    func presentServiceError()
    func presentListMovies(movies: [PopularMovieEntity])
}

protocol MoviesViewDisplayLogic {
    func displayListMovies(viewModel: [PopularMovieEntity])
    func displayListEmptyMovies(text: String, sizeTitle: CGFloat)
}

protocol MoviesViewWireFrame: AnyObject {
    
}
