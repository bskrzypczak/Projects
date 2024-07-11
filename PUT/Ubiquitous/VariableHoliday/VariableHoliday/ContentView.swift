//
//  ContentView.swift
//  VariableHoliday
//
//  Created by student on 18/03/2024.
//

import SwiftUI

struct ContentView: View {
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMMM yyyy"
        return formatter
    }()
    
    @State var dateStart = Date()
    @State var dateEnd = Date()
    var body: some View {
        VStack {
            Text("Date Calculator")
                .font(.title)
            
            Spacer()
                .frame(height: 50)
            
            DatePicker("Enter date", selection: $dateStart, in: Date.now..., displayedComponents: .date)
            
                .datePickerStyle(.automatic)
                .frame(maxHeight: 100)
            Text("You have selected \(dateStart, formatter: dateFormatter)")
            
            Spacer()
                .frame(height: 20)
            
            DatePicker("Enter date", selection: $dateEnd, in: dateStart..., displayedComponents: .date)
                .datePickerStyle(.automatic)
                .frame(maxHeight: 100)
            Text("You have selected \(dateEnd, formatter: dateFormatter)")
            
            Spacer()
                .frame(height: 50)
            
            Text("Days between: \(dateStart.daysBetween(date: dateEnd))")
            
            Text("Workdays between: \(dateStart.workdaysBetween(dateEnd: dateEnd))")
            
            Spacer()
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
