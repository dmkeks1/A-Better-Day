//
//  Day.swift
//  A Better Day
//
//  Created by Dominik Zehe on 06.11.24.
//

import Foundation
import SwiftData

@Model
class Day: Identifiable {
    
    var id: String = UUID().uuidString
    var date: Date = Date()
    var things = [Thing]()
    
    init() {
        
    }
}
