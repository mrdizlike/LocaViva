//
//  LocaVivaApp.swift
//  LocaViva
//
//  Created by Виктор on 27.06.2023.
//

import SwiftUI
import SwiftData

@main
struct LocaVivaApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
