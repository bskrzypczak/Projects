//
//  DateExtension.swift
//  VariableHoliday
//
//  Created by student on 18/03/2024.
//

import Foundation

extension Date {
    
    static func fromYMD(year: Int, month: Int, day: Int) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        var components = DateComponents(year: year, month: month, day: day, hour: 0, minute: 0, second: 0)
        components.timeZone = TimeZone(abbreviation: "GMT")
        return calendar.date(from: components)!
    }
    
    mutating func addDays(numberOfDays: Int) {
        let calendar = Calendar.current
        var dateComponent = DateComponents()
        dateComponent.hour = 24 * numberOfDays
        let newDate = calendar.date(byAdding: dateComponent, to: self) ?? Date()
        self = newDate
    }
    
    func dayNumberOfWeek() -> Int {
        return Calendar.current.dateComponents([.weekday], from: self).weekday!
    }
    
    var ymd : DateComponents {
        get {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day], from: self)
            return components
        }
    }
    
    func isSameDate(date: Date) -> Bool {
        let me = self.ymd
        let other = date.ymd
        if me == other {
            return true
        }
        return false
    }
    
    func daysBetween(date: Date) -> Int {
        let calendar = Calendar.current
        let dateMe = calendar.startOfDay(for: self)
        let dateOther = calendar.startOfDay(for: date)
        let numberOfDays = calendar.dateComponents([.day], from: dateMe, to: dateOther)
        return numberOfDays.day!
    }
    
    func isWeekend() -> Bool {
        switch self.dayNumberOfWeek() {
        case 1,7: //1 to niedziela, 7 to sobota
            return true
        default:
            return false
        }
    }
    
    func workdaysBetween(dateEnd: Date) -> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/mm"
        let holiday = [formatter.date(from: "01/01"), formatter.date(from: "06/01"), formatter.date(from: "01/05"), formatter.date(from: "03/05"), formatter.date(from: "15/08"), formatter.date(from: "01/11"), formatter.date(from: "11/11"), formatter.date(from: "25/12"), formatter.date(from: "26/12")]
        
        var numberOfWorkDays = 0
        var currentDate = self
        let calendar = Calendar.current
        while currentDate <= dateEnd {
            if currentDate.dayNumberOfWeek() != 1  && currentDate.dayNumberOfWeek() != 7 {
                numberOfWorkDays += 1
            }
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        return numberOfWorkDays
    }

}
