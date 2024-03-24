//
//  PracticeLoggerApp.swift
//  PracticeLogger
//
//  Created by Sangwook Lee on 1/14/24.
//

import SwiftUI
import SwiftData

@main
struct PracticeLoggerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Practice.self,
            History.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
