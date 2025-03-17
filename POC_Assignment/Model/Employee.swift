//
//  Employee.swift
//  POC_Assignment
//
//  Created by Tanmoy Ash on 17/03/25.
//

import Foundation
import SwiftData

@Model
class Employee: Identifiable {
    var id: UUID
    var name: String
    var position: String
    var attendance: Int
    
    init(id: UUID = UUID(), name: String, position: String, attendance: Int) {
        self.id = id
        self.name = name
        self.position = position
        self.attendance = attendance
    }
}
