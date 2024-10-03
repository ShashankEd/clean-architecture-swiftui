//
//  RemoteDataSourceProtocol.swift
//  CleanArchitectureDemo
//
//  Created by Shashank Gupta on 03/10/24.
//

import Foundation
//define the interface
protocol RemoteDataSourceProtocol {
    func getCats(limit: Int) async throws -> [CatResponse]
}
