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
            ForEach(places.placeList) { place in
                NavigationLink {
                    DetailView(place: place)
                } label: {
                    Text(place.name)
                }
                .padding()
            }
            .onDelete(perform: deleteListRow)
        }
    }
        
    func deleteListRow(_ offset: IndexSet) {
        places.deletePlace(offset)
    }
}

//struct SavedListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedListView()
//    }
//}
