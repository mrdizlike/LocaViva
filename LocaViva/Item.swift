//
//  Item.swift
//  LocaViva
//
//  Created by Виктор on 27.06.2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
