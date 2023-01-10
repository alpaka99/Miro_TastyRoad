//
//  DetailView.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/12/16.
//

import SwiftUI

struct DetailView: View {

    @EnvironmentObject var place: Place
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
//    var place: Place
    
    var body: some View {
        VStack {
            Text("음식점 이름: \(place.placeName)")
                .padding()
            
            Text("메모: \(place.placeDescriptions)")
                .padding()
        }
        .navigationTitle(place.placeName)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    EditView(editedName: place.placeName, editedDescriptions: place.placeDescriptions)
                        .environmentObject(place)
                } label: {
                    HStack {
                        Image(systemName: "pencil")
                        Text("Edit")
                    }
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
//                    @FetchRequest( entity: Place.entity(), sortDescriptors: [], predicate: NSPredicate(format: "id == %@", place.id as CVarArg)) var places: FetchedResults<Place>
//
                    deletePlace()
                    
//                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "trash.fill")
                        Text("Delete")
                    }
                }
            }
        }
    }
    
    func deletePlace() {
        moc.delete(place)
        
        try? moc.save()
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(place: Place.example)
//    }
//}
