//
//  Thing.swift
//  A Better Day Workshop
//
//  Created by Chris Ching on 2024-10-06.
//

import Foundation
import SwiftData

@Model
class Thing: Identifiable {
    
    var id: String = UUID().uuidString
    var title: String = ""
    var lastUpdated: Date = Date()
    var isHidden: Bool = false
    
    init(title: String) {
        self.title = title
    }
}
