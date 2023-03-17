//
//  Miro_TastyRoadApp.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/11/12.
//

import SwiftUI

@main
struct Miro_TastyRoadApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
