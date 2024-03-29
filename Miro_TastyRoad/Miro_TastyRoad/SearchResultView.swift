//
//  SearchResultView.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/12/15.
//

import SwiftUI

struct SearchResultView: View {
//    @EnvironmentObject var places: Places
    
    @ObservedObject var naverShared = NaverDataManager.naverShared
    
    @State private var showSavePlace = false
    
    let searchText: String
    
    var body: some View {
        HStack {
            if naverShared.searchResults == nil {
                ProgressView{
                    Text("Loading")
                        .font(.headline)
                }
            } else {
                if naverShared.searchResults!.items.isEmpty {
                    Text("No Results")
                } else {
                    List {
                        Text("Search Result")
                            .font(.title)
                        
                        ForEach(NaverDataManager.naverShared.searchResults!.items, id: \.self) { item in
                            HStack(alignment: .lastTextBaseline) {
                                Text(item.filteredTitle)
                                Spacer()
                                Text(item.filteredCategory)
                            }
                            .font(.headline)
                            .padding()
                            .background(Color(red: 0.5, green: 0.5, blue: 1))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .swipeActions {
                                Button {
                                    showSavePlace = true
                                } label: {
                                    Text("Save")
                                }
                                .tint(.green)
                            }
                        }
                    }
                    .sheet(isPresented: $showSavePlace) {
                        SavePlace(latitude: 0, longitude: 0)
                    }
                }
            }
        }
        .onAppear(perform: doSearch)
        .onDisappear(perform: doDismiss)
    }
    
    func doSearch() {
        let naverFetcher = NaverFetcher()
        Task {
            await naverFetcher.fetch(searchText)
        }
    }
    
    func doDismiss() {
        NaverDataManager.naverShared.searchResults = nil
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(searchText: "서울")
    }
}



//                ScrollView(showsIndicators: true) {
//                    VStack {
//                        ForEach(NaverDataManager.naverShared.searchResults!.items, id: \.self) { item in
//                            ZStack {
//                                Color(red: 0.5, green: 0.5, blue: 1.0)
//
//                                HStack {
//                                    Text(item.filteredTitle)
//                                    Spacer()
//                                    VStack {
//                                        Text(item.filteredCategory)
//                                    }
//                                }
//                                .font(.headline)
//                                .foregroundColor(.white)
//                                .padding()
//                            }
//                            .cornerRadius(15)
//                            .padding(2)
//                            .swipeActions {
//                                Button("HI") {
//
//                                }
//                            }
//                        }
//                    }
//                    .frame(maxWidth: .infinity)
//                }
