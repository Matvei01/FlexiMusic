//
//  Track.swift
//  FlexiMusic
//
//  Created by Matvei Khlestov on 05.09.2024.
//

import Foundation

struct Track {
    let trackName: String
    let artistName: String
    
    var title: String {
        "\(artistName) - \(trackName)"
    }
}

extension Track {
    static func getTrackList() -> [Track] {
        [
            Track(trackName: "7 Elements (Original Mix)", artistName: "Alberto Ruiz"),
            Track(trackName: "Red Eye (Original Mix)", artistName: "Dave Wincent"),
            Track(trackName: "End Station (Original Mix)", artistName: "E-Spectro"),
            Track(trackName: "Phasma (Konstantin Yoodza Remix)", artistName: "Edna Ann"),
            Track(trackName: "Delusion (Original Mix)", artistName: "Ilija Djokovic"),
            Track(trackName: "Mycelium (Original Mix)", artistName: "John Baptiste"),
            Track(trackName: "Fingerprint (Original Mix)", artistName: "Lane 8"),
            Track(trackName: "Pink Is My Favorite Color (Alex Stein Remix)", artistName: "Mac Vaughn"),
            Track(trackName: "Badmash (Original Mix)", artistName: "Metodi Hristov, Gallya"),
            Track(trackName: "Nightmare (Original Mix)", artistName: "Veerus, Maxie Devine")
        ]
    }
}
