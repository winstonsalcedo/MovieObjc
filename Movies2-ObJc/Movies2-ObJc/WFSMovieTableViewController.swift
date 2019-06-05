//
//  WFSMovieTableViewController.swift
//  Movies2-ObJc
//
//  Created by winston salcedo on 6/5/19.
//  Copyright © 2019 Evolve Technologies. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    // MARK: - Properties
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    var movies: [WFSMovie] = [];
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting the searchBar delegate
        movieSearchBar.delegate = self
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        let movie = movies[indexPath.row]
        cell.movie = movie
        return cell
    }
    
    // MARK: - Navigation
    // Segueing to the movieDetailView based on row clicked, getting poster for clicked movie
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let destinationVC = segue.destination as? WFSMovieDetailViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let movie = movies[indexPath.row]
                    destinationVC.movie = movie
                }
            }
        }
    }
}

extension MovieTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // get title and check the search bar isn't empty
        guard let title = movieSearchBar.text, !title.isEmpty else { return }
        
        // make to query request
        WFSMovieController.fetchMovies(withTitle: title) { (movies) in
            
            // do we have any movies back?
            guard let movies = movies else { return }
            
            // refresh the table
            DispatchQueue.main.async {
                self.movies = movies
                self.tableView.reloadData()
            }
        }
    }
}
