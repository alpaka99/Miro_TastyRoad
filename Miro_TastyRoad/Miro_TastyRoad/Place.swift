//
//  Place.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/11/13.
//

import Foundation

struct Place: Hashable {
    let name: String
    let description: String
}

class Places: ObservableObject {
    var placeList = [Place]()
    
    func saveNewPlace(name: String, description: String) {
        var newPlace = Place(name: name, description: description)
        objectWillChange.send()
        placeList.append(newPlace)
        
    }
}
