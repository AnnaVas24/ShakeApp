//
//  NetworkManager.swift
//  ShakeApp
//
//  Created by Vasichko Anna on 29.03.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(completion: @escaping(Result<Cocktail, NetworkError>) -> Void) {
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/random.php") else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                completion(.failure(.noData))
                return
            }
            do {
                let cocktail = try JSONDecoder().decode(Cocktail.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(cocktail))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
//    func fetchImage(from url: URL, completion: @escaping(Result<Data, NetworkError>) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, _, error in
//
//            guard let data = data else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//            DispatchQueue.main.async {
//                completion(.success(data))
//            }
//        }.resume()
//    }
}
