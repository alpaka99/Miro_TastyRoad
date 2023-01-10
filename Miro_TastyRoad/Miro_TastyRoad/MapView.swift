//
//  MapView.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/11/13.
//

import SwiftUI
import MapKit

struct MapView: View {
//    @EnvironmentObject var places: Places
    @FetchRequest(sortDescriptors: []) var places: FetchedResults<Place>
    @Environment(\.managedObjectContext) var moc
    
    // start location: Seoul, Jongak Station
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.570212883541835, longitude: 126.98303503392553), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @State private var searchText = ""
    @State private var userLocation = MKUserLocation()
    @State private var searchLogs = Set<String>()
    @State private var showingSavePlace = false
    @State private var showingEditView = false
    
    let locationFetcher = LocationFetcher()
    
    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $mapRegion, showsUserLocation: true, annotationItems: places) { place in
                    MapAnnotation(coordinate: place.coordinate) {
                        VStack(spacing: 0) {
                            Text(place.placeName)
                            
                            Image(systemName: "star.circle.fill")
                                       .resizable()
                                       .foregroundColor(.blue)
                                       .frame(width: 30, height: 30)
                                       .background(.white)
                                       .clipShape(Circle())
                        }
                        .contextMenu {
                            Button {
                                deletePlace(place.id)
                            } label: {
                                Label("Delete", systemImage: "delete.left.fill")
                            }
                            
                            Button {
                                showingEditView.toggle()
                            } label: {
                                Label("Edit", systemImage: "pencil.and.ellipsis.rectangle")
                            }
                        }
                        
                        NavigationLink("", isActive: $showingEditView) {
                            EditView(editedName: place.placeName, editedDescriptions: place.placeDescriptions)
                                .environmentObject(place)
                        }
                    }
                }
                    .ignoresSafeArea()
                
                Circle()
                    .fill(.red)
                    .opacity(0.5)
                    .frame(width: 15, height: 15)
            }
            .sheet(isPresented: $showingSavePlace) {
                SavePlace(latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("SavePlace") {
                        showingSavePlace.toggle()
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                            self.locationFetcher.start()
                            if let location = self.locationFetcher.lastKnownLocation {
                                print("Your location is \(location)")
                                mapRegion.center = location
                            } else {
                                mapRegion.center = CLLocationCoordinate2D(latitude: 37.570212883541835, longitude: 126.98303503392553)
                            }
                    } label: {
                        HStack {
                            Image(systemName: "location.circle")
                            Text("Current Location")
                        }
                    }
//                    .background(.ultraThinMaterial)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        CustomSearchView()
                    } label: {
                        HStack {
                            Text("Search")
                            Image(systemName: "magnifyingglass")
                        }
                    }
//                    .background(.ultraThinMaterial)
                }
            }
        }
    }
    
    func deletePlace(_ id: UUID) {
        for i in (0..<places.count) {
            if places[i].id == id {
                moc.delete(places[i])

                if moc.hasChanges {
                    try? moc.save()
                }
                break
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
