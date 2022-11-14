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
    
    // start location: Seoul, Jongak Station
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.570212883541835, longitude: 126.98303503392553), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @State private var searchText = ""
    @State private var userLocation = MKUserLocation()
    
    let locationFetcher = LocationFetcher()
    
    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $mapRegion, showsUserLocation: true, annotationItems: places.placeList) { place in
                    MapAnnotation(coordinate: place.coordinate) {
                        ZStack {
                            Image(systemName: "flag.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.red)
                                .frame(width: 20, height: 20)
                            
//                            Circle()
//                                .stroke(.red)
//                                .frame(width:25, height: 25)
                        }
                        .onTapGesture {
                            print(place.name)
                        }
                        
                    }
                }
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
                        places.saveNewPlace(name: "TestRow", description: "TestDescription", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
                        
//                        print(places.placeList)
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Move to user's location") {
                            self.locationFetcher.start()
                            if let location = self.locationFetcher.lastKnownLocation {
                                print("Your location is \(location)")
                                mapRegion.center = location
                            } else {
                                mapRegion.center = CLLocationCoordinate2D(latitude: 37.570212883541835, longitude: 126.98303503392553)
                            }
                                }
                }
            }
        }
    }
    
    func mark() {
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
