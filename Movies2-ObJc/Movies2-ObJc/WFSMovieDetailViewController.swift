//
//  WFSMovieDetailViewController.swift
//  Movies2-ObJc
//
//  Created by winston salcedo on 6/5/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//

import UIKit

class WFSMovieDetailViewController: UIViewController {

        
        // MARK: - Properties
        
        @IBOutlet weak var movieDetailTitle: UILabel!
        @IBOutlet weak var movieDetailRating: UILabel!
        @IBOutlet weak var movieDetailSummary: UILabel!
        
        // movie landingpad
        var movie: WFSMovie?
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // updating the view as the information changes
            movieDetailTitle.text = movie?.title
            movieDetailRating.text = "Rating: \(Int(truncating: movie?.rating ?? 0))"
            movieDetailSummary.text = movie?.overview
        }
}
