//
//  CatRepositoryProtocol.swift
//  CleanArchitectureDemo
//
//  Created by Shashank Gupta on 03/10/24.
//

import Foundation
protocol CatRepositoryProtocol {
    func getCats(limit: Int) async throws -> [CatModel]
}
