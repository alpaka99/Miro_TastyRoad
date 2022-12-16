//
//  CustomSearchView.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/12/14.
//

import SwiftUI

struct CustomSearchView: View {
    @EnvironmentObject var places: Places
    
    @State private var searchText = ""
    @State private var searchLogs = Set<String>()
    
    @State private var searching = false
    @State private var showSearchResult = false
    
    var body: some View {
        VStack(alignment: .leading) {
            // searchbar
            ZStack {
                Rectangle()
                    .foregroundColor(.secondary)
                    .background(Color(red: 0.5, green: 0.5, blue: 1))
                
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Where to?", text: $searchText) { startEditing in
                        if startEditing {
                            withAnimation {
                                searching = true
                            }
                        }
                    } onCommit: {
                        searchLogs.insert(searchText)
                        searching = false
                        showSearchResult.toggle()
                    }
                    Image(systemName: "xmark")
                        .onTapGesture {
                            searchText = ""
                            withAnimation {
                                searching = false
                            }
                        }
                }
                .foregroundColor(.white)
                .padding(13)
            }
            .frame(height: 40)
            .cornerRadius(13)
            .padding()
            
            // searched logs
            List(searchResults, id: \.self) { log in
                HStack {
                    Text(log)
                    Spacer()
                    Image(systemName: "xmark")
                        .onTapGesture {
                            deleteLog(log: log)
                        }
                }
                .onTapGesture {
                    searching = false
                    searchText = log
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle(searching ?  "Searching..." : "Custom Searchbar")
            .navigationBarTitleDisplayMode(.inline)
            .gesture(DragGesture()
                .onChanged({ _ in
                    UIApplication.shared.dismissKeyboard()
                }))
            
            NavigationLink("To SearchResultView", isActive: $showSearchResult) {
                SearchResultView(searchText: searchText)
            }
            .hidden()
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return Array(searchLogs)
        } else {
            return searchLogs.filter {  $0.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    
    func deleteLog(log: String) {
        searchLogs.remove(log)
    }
}

//struct SearchBar: View {
//    @Binding var searchText: String
//    @Binding var searching: Bool
//    @Binding var searchLogs: Set<String>
//
//    var body: some View {
//        ZStack {
//            Rectangle()
//                .foregroundColor(.secondary)
//                .background(.gray)
//
//            HStack {
//                Image(systemName: "magnifyingglass")
//
//                TextField("Where to?", text: $searchText) { startEditing in
//                    if startEditing {
//                        withAnimation {
//                            searching = true
//                        }
//                    }
//                } onCommit: {
//                    searching = false
//                    doSearch()
//                }
//
//                Image(systemName: "xmark")
//                    .onTapGesture {
//                        searchText = ""
//                        withAnimation {
//                            searching = false
//                        }
//                    }
//            }
//            .foregroundColor(.white)
//            .padding(13)
//        }
//        .frame(height: 40)
//        .cornerRadius(13)
//        .padding()
//    }
//
//    func doSearch() {
//        searchLogs.insert(searchText)
//        let naverFetcher = NaverFetcher()
//        Task {
//            await naverFetcher.fetch(searchText)
//            print("done")
//        }
//    }
//}

// 검색했던 리스트를 돌아다닐때 키보드가 자연스럽게 내려가는 기능을 위한 익스텐션
extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct CustomSearchView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchView()
    }
}
