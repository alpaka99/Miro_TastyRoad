//
//  DetailView.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/12/16.
//

import SwiftUI

struct DetailView: View {
    
    let place: Place
    
    var body: some View {
        VStack {
            Text("음식점 이름: \(place.placeName)")
                .padding()
            
            Text("메모: \(place.placeDescriptions)")
                .padding()
        }
        .navigationTitle(place.placeName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(place: Place.example)
//    }
//}
