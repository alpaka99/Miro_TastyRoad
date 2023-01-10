//
//  ContentView.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/11/12.
//

import SwiftUI
import MapKit

struct ContentView: View {
//    @State private var places = Places()
    
    var body: some View {
        NavigationView {
            TabView {
                MapView()
                    .tabItem {
                        Image(systemName: "map")
                        Text("Map")
                    }
                SavedListView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("SavedList")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.crop.square.fill")
                        Text("Profile")
                    }
            }
            .navigationTitle("미로(TastyRoad)")
            .navigationBarTitleDisplayMode(.inline)
//            .environmentObject(places)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
