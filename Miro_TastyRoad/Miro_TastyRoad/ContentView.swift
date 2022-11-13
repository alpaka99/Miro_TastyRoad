//
//  ContentView.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/11/12.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var places = Places()
    
    var body: some View {
        NavigationView {
            TabView {
                MapView()
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("Map")
                    }
                SavedListView()
                    .tabItem {
                        Image(systemName: "2.square.fill")
                        Text("SavedList")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "3.square.fill")
                        Text("Profile")
                    }
            }
            .navigationTitle("미로(TastyRoad)")
            .navigationBarTitleDisplayMode(.inline)
            .environmentObject(places)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
