//
//  A_Better_Day_WorkshopApp.swift
//  A Better Day Workshop
//
//  Created by Chris Ching on 2024-10-06.
//

import SwiftUI
import SwiftData

@main
struct BetterDay: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .modelContainer(for: [Day.self, Thing.self])
        }
    }
}
