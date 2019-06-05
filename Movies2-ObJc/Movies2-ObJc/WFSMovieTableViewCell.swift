//
//  WFSMovieTableViewCell.swift
//  Movies2-ObJc
//
//  Created by winston salcedo on 6/5/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//

    import UIKit
    
    class MovieTableViewCell: UITableViewCell {
        
        // MARK: - Properties
        @IBOutlet weak var movieTitleLabel: UILabel!
        @IBOutlet weak var movieRatingLable: UILabel!
        @IBOutlet weak var movieSummaryLabel: UILabel!
        @IBOutlet weak var moviePosterImage: UIImageView!
        
        // landing pad
        var movie: WFSMovie? {
            didSet {
                updateViews()
            }
        }
        
        // MARK: - Methods
        // update the views as the data changes
        func updateViews() {
            // checking the movie info
            guard let movie = movie else { return }
            
            // updating the outlets
            DispatchQueue.main.async {
                self.movieTitleLabel.text = "Title: \(movie.title)"
                self.movieRatingLable.text = "Rating: \(Int(truncating: movie.rating))"
                self.movieSummaryLabel.text = "Overview: \(movie.overview)"
               // self.moviePosterImage.image = movie.posterImage
                
            }
        }
}
