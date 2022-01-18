//
//  ToHeadlinesResponse.swift
//  NewsApp
//
//  Created by Игорь  Архипов on 18.01.2022.
//

import Foundation

struct TopHeadlinesResponse: Decodable{
    let articles: [Article]
}
