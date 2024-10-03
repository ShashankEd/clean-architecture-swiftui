//
//  Injection.swift
//  CleanArchitectureDemo
//
//  Created by Shashank Gupta on 03/10/24.
//

import Foundation
//DI struct
struct Injection{
    
    private init(){}
    
    static let shared: Injection = Injection()
    
    private func provideRepository() -> CatRepositoryProtocol {
        let remote: RemoteDataSource = RemoteDataSource.shared
        return CatRepositoryImpl.sharedInstance(remote)
    }
    
    func provideGetCatsUseCase() -> GetCatsUseCase {
        GetCatsUseCaseImpl(repo: provideRepository())
    }
}
