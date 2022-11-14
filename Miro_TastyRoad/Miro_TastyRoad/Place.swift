//
//  Place.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/11/13.
//

import Foundation
import CoreLocation

struct Place: Identifiable, Hashable {
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.name < rhs.name
    }
    
    let id = UUID()
    let name: String
    let description: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

class Places: ObservableObject {
    var placeList = [Place]()
    
    func saveNewPlace(name: String, description: String, latitude: Double, longitude: Double) {
        var newPlace = Place(name: name, description: description, latitude: latitude, longitude: longitude)
        objectWillChange.send()
        placeList.append(newPlace)
        
    }
}
