//
//  GetCatsUseCase.swift
//  CleanArchitectureDemo
//
//  Created by Shashank Gupta on 03/10/24.
//

import Foundation

protocol GetCatsUseCase {
    func execute(limit: Int) async throws -> Result<[CatModel], Error>
}

struct GetCatsUseCaseImpl: GetCatsUseCase {
    let repo: CatRepositoryProtocol
    func execute(limit: Int) async throws -> Result<[CatModel], Error> {
        do {
            let cats = try await repo.getCats(limit: limit)
            return .success(cats)
        } catch {
            return .failure(error)
        }
    }
}
