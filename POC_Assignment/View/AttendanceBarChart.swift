//
//  Untitled.swift
//  POC_Assignment
//
//  Created by Tanmoy Ash on 17/03/25.
//

import SwiftUI

struct AttendanceBarChart: View {
    var employees: [Employee]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Attendance Chart").font(.headline)
            
            GeometryReader { geometry in
                HStack(alignment: .bottom, spacing: 10) {
                    ForEach(employees) { emp in
                        VStack {
                            Rectangle()
                                .fill(Color.blue)
                                .frame(height: CGFloat(emp.attendance) / 30.0 * geometry.size.height)
                            Text(emp.name.prefix(3))
                                .font(.caption)
                        }
                    }
                }
            }
        }
    }
}
