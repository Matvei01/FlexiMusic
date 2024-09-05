//
//  SearchTableViewController.swift
//  FlexiMusic
//
//  Created by Matvei Khlestov on 03.09.2024.
//

import UIKit

final class SearchTableViewController: UITableViewController {
    
    private let tracks = Track.getTrackList()
    private let searchController = UISearchController(
        searchResultsController: nil
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCell()
        setupSearchBar()
    }
}

// MARK: - Private Methods
extension SearchTableViewController {
    private func registerTableViewCell() {
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "cell"
        )
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension SearchTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let track = tracks[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = track.trackName
        content.secondaryText = track.artistName
        content.image = UIImage(systemName: "music.mic.circle")
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UISearchBarDelegate
extension SearchTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        }
    }

