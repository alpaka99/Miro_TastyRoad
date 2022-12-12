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
        print("0")
        let query = "https://openapi.naver.com/v1/search/local.json?query=\(queryValue)"
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        guard let url = URL(string: encodedQuery) else {
            print("Invalid URL")
            return
        }
        
        print("1")
        var request = URLRequest.init(url: url)
        
        print("2")
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-type")
        request.addValue(clientId, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        print("3")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print("4")
            guard error == nil else {print(error); return}
            guard let data = data else {
                 print(error)
                 return
             }
            print(response)
            do {
                let searchInfo = try JSONDecoder().decode(NaverResult.self, from: data)
                print(searchInfo)
            } catch {
                print("Decode error")
            }
        }
        
        task.resume()
    }
}
