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
            Text(place.name)
            Text(place.description)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(place: Place.example)
    }
}
