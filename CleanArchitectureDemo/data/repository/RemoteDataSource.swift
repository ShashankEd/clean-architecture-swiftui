//
//  RemoteDataSource.swift
//  CleanArchitectureDemo
//
//  Created by Shashank Gupta on 03/10/24.
//

import Foundation

struct RemoteDataSource {
    private init() {}
    static let shared: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    func getCats(limit: Int) async throws -> [CatResponse] {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=\(limit)") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            return try JSONDecoder().decode([CatResponse].self, from: data)
        } catch {
            throw URLError(.cannotParseResponse)
        }
    }
    
}

