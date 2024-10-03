//
//  CatResponse.swift
//  CleanArchitectureDemo
//
//  Created by Shashank Gupta on 03/10/24.
//

import Foundation
struct CatResponse: Decodable {
    var id: String
    var url: String
    var width: Int
    var height: Int
}
