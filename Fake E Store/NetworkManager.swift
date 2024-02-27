//
//  NetworkManager.swift
//  Fake E Store
//
//  Created by Aniket Kumar on 11/02/24.
//

import UIKit

enum DataHandlingError: Error {
    case invalideResponse
    case invalidURL
    case invalidDecoding
    case invalidData
    case message(_ error: Error?)
}

class NetworkManager {
    static let shared = NetworkManager() // Large Singleton
    
    private init() {}
    
    func fetchProductData(completion: @escaping (Result<[ProductModel], DataHandlingError>) -> Void) {
        guard let url = URL(string: Constant.API.productURL) else { 
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else { 
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                completion(.failure(.invalideResponse))
                return
            }
            
            do {
                let product = try JSONDecoder().decode([ProductModel].self, from: data)
                completion(.success(product))
            } catch {
                completion(.failure(.message(error)))
            }
        }.resume()
    }
}
