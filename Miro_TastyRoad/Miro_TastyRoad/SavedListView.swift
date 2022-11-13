//
//  SavedListView.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/11/13.
//

import SwiftUI

struct SavedListView: View {
    @EnvironmentObject var places: Places
    
    var body: some View {
        List {
            ForEach(places.placeList, id: \.self) { place in
                Text(place.name)
            }
        }
    }
        
}

struct SavedListView_Previews: PreviewProvider {
    static var previews: some View {
        SavedListView()
    }
}
