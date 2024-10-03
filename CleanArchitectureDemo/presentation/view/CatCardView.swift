//
//  CatCardView.swift
//  CleanArchitectureDemo
//
//  Created by Shashank Gupta on 03/10/24.
//

import SwiftUI

struct CatCardView: View {
    let catModel: CatModel
    
    var body: some View {
        VStack{
            Spacer()
            AsyncImage(url: URL(string: catModel.url)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
            } placeholder: {
                Rectangle().fill(.ultraThinMaterial)
                    .frame(width: 120, height: 120)
            }

            Text(catModel.id)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(.black)
                .padding(.top, 4)
        }
        .shadow(color: Color(.bg), radius: 24, x: 0, y: 16)
        .padding(16)
        .background(Color("bg"))
        .cornerRadius(8)
    }
}

#Preview {
    CatCardView(catModel: CatModel(id: "", url: ""))
}
