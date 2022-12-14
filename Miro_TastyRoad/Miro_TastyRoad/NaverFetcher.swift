//
//  NaverFetcher.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/11/19.
//

import Foundation

class NaverFetcher {
    let clientId = "cYYqSUbX1kaYqMBgprRU"
    let clientSecret = "yBz7uC0Y_T"
    
    func fetch(_ queryValue: String) async {
        
        let query = "https://openapi.naver.com/v1/search/local.json?query=\(queryValue)&display=10"
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        guard let url = URL(string: encodedQuery) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest.init(url: url)
        
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-type")
        request.addValue(clientId, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {print(error); return}
            guard let data = data else {
                 print(error)
                 return
             }
//            print(response)
            do {
                let searchInfo = try JSONDecoder().decode(NaverResult.self, from: data)
//                return searchInfo
                print(searchInfo)
            } catch {
                print("Decode error")
            }
        }
        
        task.resume()
    }
}
