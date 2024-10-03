//
//  HomeView.swift
//  CleanArchitectureDemo
//
//  Created by Shashank Gupta on 03/10/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel = .init(
        getCatsUseCase: Injection.shared.provideGetCatsUseCase()
    )
    
    var body: some View {
        VStack(alignment: .leading) {
            logo
            if viewModel.isLoading {
                Spacer()
                HStack{
                    Spacer()
                    ProgressView()
                    Spacer()
                }
                Spacer()
            } else {
                catList
            }
            
        }
        .ignoresSafeArea()
        .background(
            VStack{
                Image("bg")
                    .padding(.top, -100)
                Spacer()
            }
        )
        .task {
            do{
                try await viewModel.getCats(limit: 10)
            }catch{
                print(error)
            }
        }
    }
}

extension HomeView {
    var logo : some View {
        HStack{
            Spacer()
            Image("logo")
                .resizable()
                .scaledToFill()
                .frame(width: 130, height: 48)
            Spacer()
        }
        .padding(.top, 64)
        .padding(.horizontal, 24)
    }
    
    var title : some View {
        Text("Animals")
            .font(.system(size: 24, weight: .semibold, design: .rounded))
            .foregroundColor(.black)
            .padding(.horizontal, 24)
    }
    
    var catList : some View {
        ScrollView {
            HStack {
                title
                Spacer()
            }
            
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 150)), GridItem(.adaptive(minimum: 150))], spacing: 16
            ) {
                // list through the cats and construct
                ForEach(viewModel.cats, id:\.id) { cat in
                    CatCardView(catModel: cat)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    HomeView()
}
