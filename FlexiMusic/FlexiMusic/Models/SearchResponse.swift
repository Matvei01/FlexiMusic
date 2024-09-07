//
//  SearchResponse.swift
//  FlexiMusic
//
//  Created by Matvei Khlestov on 05.09.2024.
//

import Foundation

struct SearchResponse: Decodable {
    let resultCount: Int
    let results: [Track]
}

struct Track: Decodable {
    let trackName: String?
    let artistName: String?
    let collectionName: String?
    let artworkUrl100: String?
}

