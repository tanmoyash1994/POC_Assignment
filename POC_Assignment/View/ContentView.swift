//
//  ContentView.swift
//  POC_Assignment
//
//  Created by Tanmoy Ash on 17/03/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @StateObject private var employeeViewModel: EmployeeViewModel
    
    init() {
        _employeeViewModel = StateObject(wrappedValue: EmployeeViewModel(context: ModelContext(PersistentContainer.shared.container)))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button("Sort Asc") {
                        employeeViewModel.sortAscending()
                    }
                    .buttonStyle(.borderedProminent)

                    Button("Sort Desc") {
                        employeeViewModel.sortDescending()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()

                List(employeeViewModel.employees) { employee in
                    VStack(alignment: .leading) {
                        Text(employee.name).font(.headline)
                        Text(employee.position).font(.subheadline)
                        Text("Attendance: \(employee.attendance) days")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                
                AttendanceBarChart(employees: employeeViewModel.employees)
                    .frame(height: 250)
                    .padding()
            }
            .navigationTitle("Employees")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
