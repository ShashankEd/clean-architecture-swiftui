//
//  HomeViewModel.swift
//  CleanArchitectureDemo
//
//  Created by Shashank Gupta on 03/10/24.
//

import Foundation

@MainActor class HomeViewModel: ObservableObject {
    //ref for the use case
    let getCatsUseCase: GetCatsUseCase
    
    @Published var cats: [CatModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    init(getCatsUseCase: GetCatsUseCase) {
        self.getCatsUseCase = getCatsUseCase
    }
    
    func getCats(limit: Int) async throws {
        isLoading = true
        let result = try await getCatsUseCase.execute(limit: limit)
        switch result {
            case .success(let cats):
                self.cats = cats
                self.isLoading = false
                
            case .failure(let failure):
                self.isLoading = false
                self.errorMessage = failure.localizedDescription
        }
    }
    
}
