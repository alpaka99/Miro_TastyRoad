//
//  NaverResult.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/12/12.
//

import Foundation


struct NaverResult: Codable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [Item]
    
    static let naverResultExample = NaverResult(lastBuildDate: "now", total: 0, start: 1, display: 1, items: [Item](repeating: Item.naverItemExample, count: 5))
}

struct Item: Codable, Hashable {
    let title: String
    let link: String?
    let category, description, telephone, address: String?
    let roadAddress, mapx, mapy: String?
    
    var filteredTitle: String {
        var returnTitle = title
        returnTitle = returnTitle.replacingOccurrences(of: "<b>", with: "")
        returnTitle = returnTitle.replacingOccurrences(of: "</b>", with: " ")
        return returnTitle
        
    }
    
    var filteredCategory: String {
        if category != nil {
            let categories = category!.components(separatedBy: ">")
            return categories[categories.count-1]
        } else {
            return "???"
        }
    }

    enum CodingKeys: String, CodingKey {
        case title, link, category
        case description = "description"
        case telephone, address, roadAddress, mapx, mapy
    }
    
    static let naverItemExample = Item(title: "test", link: "test", category: "test", description: "test", telephone: "test", address: "test", roadAddress: "test", mapx: "test", mapy: "test")
}
