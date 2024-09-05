//
//  SearchTableViewController.swift
//  FlexiMusic
//
//  Created by Matvei Khlestov on 03.09.2024.
//

import UIKit

final class SearchTableViewController: UITableViewController {

    private let tracks = Track.getTrackList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "cell"
        )
    }

    // MARK: - Table view data source
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
