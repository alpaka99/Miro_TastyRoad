//
//  MapView.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/11/13.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var places: Places
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $mapRegion)
                    .ignoresSafeArea()
                
                Circle()
                    .fill(.red)
                    .opacity(0.5)
                    .frame(width: 15, height: 15)
            }
            .searchable(text: $searchText, prompt: "Where to?")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("SavePlace") {
                        places.saveNewPlace(name: "TestRow", description: "TestDescription")
                        
                        print(places.placeList)
                    }
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
