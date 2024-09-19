//
//  ListMoviesViewController.swift
//  MoviesApp
//
//  Created by Arlid Henao Rueda on 17/09/24.
//

import Foundation
import UIKit

class ListMoviesViewController: UIViewController {
    
    // MARK: - IBOutlet -
    @IBOutlet weak var moviesTableView: UITableView!
    
    // MARK: - Internal Properties -
    var listMovies: [PopularMovieEntity] = []
    var interactor: MoviesViewBusinessLogic?
    
    // MARK: - LyfeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getMovies()
        registerTableview()
    }
    
    private func registerTableview() {
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
}

extension ListMoviesViewController: MoviesViewDisplayLogic {
    func displayListMovies(viewModel: [PopularMovieEntity]) {
        listMovies.removeAll()
        listMovies =  viewModel
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
            self.moviesTableView.restore()
        }
    }
    
    func displayListEmptyMovies(text: String, sizeTitle: CGFloat) {
        listMovies.removeAll()
        DispatchQueue.main.async {
            self.moviesTableView.setEmptyMessage(text, size: sizeTitle)
            self.moviesTableView.reloadData()
        }
    }
}

//  MARK: - UITableViewDataSource,UITableViewDelegate -
extension ListMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        cell.configureView(listMovies[indexPath.row])
        return cell
    }
}
