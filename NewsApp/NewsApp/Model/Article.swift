//
//  Article.swift
//  NewsApp
//
//  Created by Игорь  Архипов on 17.01.2022.
//

import Foundation

struct Article: Decodable {
    let headline: String
    let urlToImage: String?
    let url: String
    
    private enum CodingKeys: String, CodingKey {
        case headline = "title"
        case urlToImage
        case url
    }
}
