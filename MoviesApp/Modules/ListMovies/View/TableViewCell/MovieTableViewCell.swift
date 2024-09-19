//
//  MovieTableViewCell.swift
//  MoviesApp
//
//  Created by Arlid Henao Rueda on 17/09/24.
//

import Foundation
import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet -
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Internal Properties -
    static let identifier = "cellMovies"
    
    static func nib() -> UINib {
        return UINib(nibName: "MovieTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Internal Functions -
    func configureView(_ viewmodel: PopularMovieEntity) {
        movieImage.kf.setImage(with: viewmodel.imageURL)
        titleLabel.text = viewmodel.title
        descriptionLabel.text = viewmodel.overview
    }
}
