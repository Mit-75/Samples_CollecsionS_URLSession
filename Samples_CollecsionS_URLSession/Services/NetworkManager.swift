//
//  NetworkManager.swift
//  Samples_CollecsionS_URLSession
//
//  Created by Dmitry Parhomenko on 10.02.2024.
//

import Foundation
/// Создаем типы ошибок
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}
// MARK: - NetworkManager
final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    //MARK: - fetch
    func fetch<T: Decodable>(_tipe: T.Type, from url: URL, completion: @escaping(Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error ?? "No error description")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let dataModel = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(dataModel))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
}
