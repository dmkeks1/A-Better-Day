//
//  A_Better_DayApp.swift
//  A Better Day
//
//  Created by Dominik Zehe on 06.11.24.
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
