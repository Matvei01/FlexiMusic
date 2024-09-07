//
//  NetworkManager.swift
//  FlexiMusic
//
//  Created by Matvei Khlestov on 05.09.2024.
//

import Foundation

final class NetworkManager {
    private let apiManager = APIManager.shared
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchTracks(searchTerm: String, completion: @escaping (Result<[Track], NetworkError>) -> Void) {
        guard let request = apiManager.createRequest(searchTerm: searchTerm) else {
            completion(.failure(.invalidRequest))
            return
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print("Response status code: \(response.statusCode)")
            }
            
            guard let data = data else {
                sendFailure(with: .noData(description: error?.localizedDescription ?? "No error description"))
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let searchResponse = try decoder.decode(SearchResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(searchResponse.results))
                }
            } catch {
                sendFailure(with: .decodingError(description: error.localizedDescription))
            }
            
            func sendFailure(with error: NetworkError) {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

// MARK: - NetworkError
extension NetworkManager {
    enum NetworkError: Error {
        case invalidRequest
        case noData(description: String)
        case decodingError(description: String)
    }
}
