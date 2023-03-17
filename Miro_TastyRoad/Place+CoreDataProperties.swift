//
//  Place+CoreDataProperties.swift
//  Miro_TastyRoad
//
//  Created by user on 2023/01/09.
//
//

import Foundation
import CoreData
import CoreLocation


extension Place {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Place> {
        return NSFetchRequest<Place>(entityName: "Place")
    }

    @NSManaged public var created: Date?
    @NSManaged public var descriptions: String?
    @NSManaged public var id: UUID
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var name: String?
    
    public var placeName: String {
        name ?? "Unknown name"
    }
    
    public var placeDescriptions: String {
        descriptions ?? "No descriptions"
    }
    
    public var placeDate: Date {
        created ?? Date.now
    }
    
    public var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}

extension Place : Identifiable {

}
