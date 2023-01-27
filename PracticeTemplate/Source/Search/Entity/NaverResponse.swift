//
//  naverResponse.swift
//  PracticeTemplate
//
//  Created by 김태형 on 2023/01/24.
//

// MARK: - NaverResponse

class NaverMovie {
    static let shared : NaverMovie = NaverMovie()
    var searchResult : NaverResponse?
    
    private init() { }
}




struct NaverResponse: Codable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let title: String
    let link: String
    let image: String
    let subtitle, pubDate, director, actor: String
    let userRating: String
}
