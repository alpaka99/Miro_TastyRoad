//
//  NaverFetcher.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/11/19.
//

import Foundation

struct NaverFetcher {
    let clientId = "ClientId"
    let clientSecret = "ClientSecret"
    func fetch() {
        let url = URL(string: "https://")!
        var request = URLRequest(url: url)
        request.addValue(clientId, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        request.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.downloadTask(with: url) { _ in
                print("hi")
            }
            
        } catch {
            print("Fetch from Naver failed")
        }
    }
    
}
