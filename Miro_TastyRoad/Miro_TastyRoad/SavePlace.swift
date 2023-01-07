//
//  SavePlace.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/11/17.
//

import SwiftUI

struct SavePlace: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    
    @EnvironmentObject var places: Places
    
    @State private var name = ""
    @State private var descriptions = ""
    
    let latitude: Double
    let longitude: Double
    
    var body: some View {
        VStack {
            Form {
                Section("About this place...") {
                    TextField("Name", text: $name)
                    TextField("Descriptions", text: $descriptions)
                }
            }
            
            Button {
//                places.saveNewPlace(name: name, description: descriptions, latitude: latitude, longitude: longitude)
                dismiss()
            } label: {
                Text("Save")
            }
            .buttonStyle(.borderedProminent)
            .disabled(name.isEmpty || descriptions.isEmpty)
        }
    }
    
}

struct SavePlace_Previews: PreviewProvider {
    static var previews: some View {
        SavePlace(latitude: Place.example.latitude, longitude: Place.example.longitude)
    }
}
