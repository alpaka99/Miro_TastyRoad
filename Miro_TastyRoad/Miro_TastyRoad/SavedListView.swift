//
//  SavedListView.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/11/13.
//

import SwiftUI

struct SavedListView: View {
//    @EnvironmentObject var places: Places
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.created, order: .reverse)]) var places: FetchedResults<Place>
    
    var body: some View {
        List {
            ForEach(places) { place in
                NavigationLink {
                    DetailView()
                        .environmentObject(place)
                } label: {
                    Text(place.placeName)
                }
                .padding()
            }
//            .onDelete(perform: deleteListRow)
        }
    }
        
//    func deleteListRow(_ offset: IndexSet) {
//        places.deletePlace(offset)
//    }
}

//struct SavedListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedListView()
//    }
//}
