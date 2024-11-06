//
//  Thing.swift
//  A Better Day
//
//  Created by Dominik Zehe on 06.11.24.
//

import Foundation
import SwiftData

@Model
class Thing: Identifiable { //≈ so its identifiable via unique id
    var id: String = UUID().uuidString //created unique string
    var title: String = "" //initializes as empty string
    var lastUpdated: Date = Date() //gets current Date
    var isHidden: Bool = false //things should be able to get hidden in app


    init(title: String) {
        self.title = title
        
    }
}
