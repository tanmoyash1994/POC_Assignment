//
//  PersistentContainer.swift
//  POC_Assignment
//
//  Created by Tanmoy Ash on 17/03/25.
//

import SwiftData

class PersistentContainer {
    static let shared = PersistentContainer()
    
    let container: ModelContainer
    
    private init() {
        let schema = Schema([Employee.self])
        container = try! ModelContainer(for: schema)
    }
}
