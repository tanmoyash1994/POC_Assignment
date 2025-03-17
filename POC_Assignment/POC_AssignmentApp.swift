//
//  POC_AssignmentApp.swift
//  POC_Assignment
//
//  Created by Tanmoy Ash on 17/03/25.
//

import SwiftUI
import SwiftData

@main
struct POC_AssignmentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(PersistentContainer.shared.container)
    }
}
