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
            Form {
                Section("About this place...") {
                    TextField("Name", text: $name)
                    TextField("Description", text: $description)
                }
            }
            
            Button {
                places.saveNewPlace(name: name, description: description, latitude: latitude, longitude: longitude)
                dismiss()
            } label: {
                Text("Save")
            }
            .buttonStyle(.borderedProminent)
            .disabled(name.isEmpty || description.isEmpty)
        }
    }
}

struct SavePlace_Previews: PreviewProvider {
    static var previews: some View {
        SavePlace(latitude: Place.example.latitude, longitude: Place.example.longitude)
    }
}
