//
//  ContentView.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/11/12.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            ZStack {
//                버튼을 위아래로 만들고 싶은데 왜 안되지?
//                VStack {
//                    HStack {
//                        Spacer()
//
//                        Button("Top") {
//                            print("Top")
//                        }
//                    }
//
//                    Spacer()
//
//                    HStack {
//                        Spacer()
//
//                        Button("Bottom") {
//                            print("Bottom")
//                        }
//                    }
//                }
                
                Map(coordinateRegion: $mapRegion)
                    .ignoresSafeArea()
                
                Circle()
                    .fill(.red)
                    .opacity(0.5)
                    .frame(width: 15, height: 15)
            }
            .searchable(text: $searchText, prompt: "Where to?")
//            .toolbar {
//                Button {
//                    print("Hello world")
//                } label: {
//                    Image(systemName: "checkmark")
//                }
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
