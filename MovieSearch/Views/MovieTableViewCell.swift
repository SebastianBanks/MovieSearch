//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by Sebastian Banks on 4/8/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    

    var movie: Movie? {
        didSet {
            updateViewCell()
        }
    }
    var favoriteMovies: [Movie] = []
    var isFavorite: Bool = false
    
    func updateViewCell() {
        guard let movie = movie else { return }
        titleLabel.text = " \(movie.title)"
        ratingLabel.text = " Rating : \(movie.rating)"
        descLabel.text = "\(movie.summary)"
        fetchPosterImage(movie: movie)
    }
    
    func fetchPosterImage(movie: Movie) {
        guard let moviePoster = movie.poster else { return }
        MovieController.fetchPoster(with: moviePoster) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let posterImage):
                    self.moviePoster.image = posterImage
                case .failure(let error):
                    print("error loading image: \(error)")
                }
            }
        }
    }
}


