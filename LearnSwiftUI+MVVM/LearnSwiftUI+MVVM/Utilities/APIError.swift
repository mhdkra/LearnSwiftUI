//
//  APError.swift
//  LearnSwiftUI+MVVM
//
//  Created by Tiara Mahardika on 30/12/22.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}
