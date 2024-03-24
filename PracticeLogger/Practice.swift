//
//  Item.swift
//  PracticeLogger
//
//  Created by Sangwook Lee on 1/14/24.
//

import Foundation
import SwiftData

@Model
final class Practice {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

@Model
final class History {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
