//
//  NaverResult.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/12/12.
//

import Foundation

class NaverDataManager {
    static let shared = NaverDataManager()
    var searchResult: NaverResult?
    
    private init() {
        
    }
}

struct NaverResult: Codable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [Item]
}

struct Item: Codable {
    let title: String
    let link: String?
    let category, description, telephone, address: String?
    let roadAddress, mapx, mapy: String?

    enum CodingKeys: String, CodingKey {
        case title, link, category
        case description = "description"
        case telephone, address, roadAddress, mapx, mapy
    }
}
