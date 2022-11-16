//
//  SavePlace.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/11/17.
//

import SwiftUI

struct SavePlace: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var places: Places
    
    @State private var name = ""
    @State private var description = ""
    
    let latitude: Double
    let longitude: Double
    
    var body: some View {
        VStack {
            TextField("For name", text: $name)
            TextField("For description", text: $description)
            Button("Save") {
                places.saveNewPlace(name: name, description: description, latitude: latitude, longitude: longitude)
                dismiss()
            }
        }
    }
}

struct SavePlace_Previews: PreviewProvider {
    static var previews: some View {
        SavePlace(latitude: Place.example.latitude, longitude: Place.example.longitude)
    }
}
