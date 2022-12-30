//
//  PostListViewModel.swift
//  LearnSwiftUI+MVVM
//
//  Created by Tiara Mahardika on 30/12/22.
//

import Foundation

final class PostListViewModel: ObservableObject{
    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    
    func getPosts(){
        NetworkManager.shared.getPost{ [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                switch result {
                case .success(let posts):
                    self?.posts = posts
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self?.alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        self?.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self?.alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        self?.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
