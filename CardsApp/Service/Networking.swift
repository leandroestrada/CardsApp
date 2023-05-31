//
//  Networking.swift
//  CardsApp
//
//  Created by leandro de araujo estrada on 31/05/23.
//

import Foundation

enum NetworkError: Error {
    case noData
}

class Networking {
    
    func getCards(completion: @escaping (Result<Cards, Error>) -> Void) {
        guard let url = URL(string: NetworkConstants.baseURL) else {
            completion(.failure(NetworkError.noData))
            return
        }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue(NetworkConstants.rapidAPIKey, forHTTPHeaderField: "X-RapidAPI-Key")
        request.addValue(NetworkConstants.rapidAPIHost, forHTTPHeaderField: "X-RapidAPI-Host")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(.failure(error ?? NetworkError.noData))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            
            do {
                let result = try decoder.decode(Cards.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
}
