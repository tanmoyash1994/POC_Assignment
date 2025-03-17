//
//  EmployeeViewModel.swift
//  POC_Assignment
//
//  Created by Tanmoy Ash on 17/03/25.
//

import Foundation
import SwiftData

@MainActor
class EmployeeViewModel: ObservableObject {
    @Published var employees: [Employee] = []
    
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
        Task {
            await loadData()
        }
    }
    
    struct EmployeeDTO: Codable {
        let id: String
        let name: String
        let position: String
        let attendance: Int
    }
    
    /// Load JSON from file, decode, and store in SwiftData
    func loadData() async {
        do {
            guard let url = Bundle.main.url(forResource: "Employees", withExtension: "json") else {
                print("JSON file not found")
                return
            }
            
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([EmployeeDTO].self, from: data)
            
            // Insert into SwiftData only if not already present (optional check)
            if try context.fetch(FetchDescriptor<Employee>()).isEmpty {
                for item in decoded {
                    let emp = Employee(id: UUID(), name: item.name, position: item.position, attendance: item.attendance)
                    context.insert(emp)
                }
                try context.save()
            }
            
            fetchEmployees()
        } catch {
            print("Failed to load data: \(error)")
        }
    }
    
    func fetchEmployees() {
        do {
            let descriptor = FetchDescriptor<Employee>()
            self.employees = try context.fetch(descriptor)
        } catch {
            print("Fetch failed: \(error)")
        }
    }
    
    func sortAscending() {
        self.employees.sort { $0.name < $1.name }
    }

    func sortDescending() {
        self.employees.sort { $0.name > $1.name }
    }
}
