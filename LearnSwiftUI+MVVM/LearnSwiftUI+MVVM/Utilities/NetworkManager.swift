//
//  NetworkManager.swift
//  LearnSwiftUI+MVVM
//
//  Created by Tiara Mahardika on 30/12/22.
//

import UIKit

class NetworkManager: NSObject {
    
    static let shared           = NetworkManager()
    private let cache           = NSCache<NSString, UIImage>()
    
    static let baseURL          = "https://jsonplaceholder.typicode.com/"
    private let fullUrl    = "https://jsonplaceholder.typicode.com/posts"
    
    private override init() {}
    
    
    func getPost(completed: @escaping (Result<[Post], APIError>) -> Void) {
        guard let url = URL(string: fullUrl) else {
            completed(.failure(.invalidURL))
            return
        }
               
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
                        
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([Post].self, from: data)
//                print(String(data: data, encoding: .utf8)!)
                completed(.success(decodedResponse))
                
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
