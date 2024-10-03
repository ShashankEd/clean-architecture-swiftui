//
//  CatRepositoryImpl.swift
//  CleanArchitectureDemo
//
//  Created by Shashank Gupta on 03/10/24.
//

import Foundation

struct CatRepositoryImpl {
    typealias CatInstance = (RemoteDataSource) -> CatRepositoryImpl
    
    fileprivate let remote: RemoteDataSource
    
    private init(remote: RemoteDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: CatInstance = { remoreRepo in
        return CatRepositoryImpl(remote: remoreRepo)
    }
}

extension CatRepositoryImpl: CatRepositoryProtocol {
    func getCats(limit: Int) async throws -> [CatModel] {
        do {
            let data = try await remote.getCats(limit: limit)
            
            return CatMapper.mapCatResponseToDomain(input: data)
        } catch {
            throw error
        }
    }
}


enum CatMapper {
    static func mapCatResponseToDomain(input response: [CatResponse]) -> [CatModel] {
        return response.map { result in
            return CatModel (
                id: result.id ,
                url: result.url 
            )
        }
    }
}
