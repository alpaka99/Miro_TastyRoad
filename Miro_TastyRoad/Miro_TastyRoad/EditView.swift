//
//  EditView.swift
//  Miro_TastyRoad
//
//  Created by user on 2023/01/10.
//

import SwiftUI

struct EditView: View {
//            @FetchRequest(sortDescriptors: [],
//                          predicate: NSPredicate(format: "id == %@", place.id as NSUUID)) var places: FetchedResults<Place>
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc

//    var place: Place
    @EnvironmentObject var place: Place
    @State var editedName: String
    @State var editedDescriptions: String
    
    var body: some View {
        VStack {
            List {
                TextField("New place name", text: $editedName)
                TextField("New place descriptions", text: $editedDescriptions)
            }
            
            Button {
                saveChanges()
                dismiss()
            } label: {
                Text("Save changes")
            }
        }
    }
    
    func saveChanges() {
        place.setValue(editedName, forKey: "name")
        place.setValue(editedDescriptions, forKey: "descriptions")
        
        if moc.hasChanges {
            try? moc.save()
        }
    }
}

//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditView(id: UUID())
//    }
//}
