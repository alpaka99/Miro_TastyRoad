//
//  NaverFetcher.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/11/19.
//

import Foundation


// 나중에 이 클래스에서 Naver Open API 검색결과를 가져와서 사용
// 싱글톤 형태로 사용하기 위해서 사용하는거라는데 싱글톤은 뭘까?
class NaverDataManager: ObservableObject {
    static let naverShared = NaverDataManager()
    
    @Published var searchResults: NaverResult?
    
    private init() {
        
    }
    
    func searchResultChange(_ searchResult: NaverResult) {
//        self.searchResults = searchResult
        // 아마 싱글톤의 문제점중에 하나인 동시성문제때문에 DispatchQueue.main.async 를 써서 메인 쓰레드에서 처리하게 한 것 같다
        DispatchQueue.main.async {
            self.searchResults = searchResult
        }
    }
}

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
                let searchResult = try JSONDecoder().decode(NaverResult.self, from: data)
                print(searchResult)
                NaverDataManager.naverShared.searchResultChange(searchResult)
//                NaverDataManager.naverShared.searchResults = searchResult
            } catch {
                print("Decode error")
            }
        }
        
        task.resume()
    }
}
