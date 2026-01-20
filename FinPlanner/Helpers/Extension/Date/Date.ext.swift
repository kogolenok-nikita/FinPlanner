//
//  Date.ext.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 31.12.25.
//

import Foundation

extension Date {
    static let dayMonthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "d MMMM YYYY"
        return formatter
    }()
    
    static let withoutDayMonthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "MMMM YYYY"
        return formatter
    }()
    
    var dayMonthYear: String {
        Self.dayMonthFormatter.string(from: self)
    }
    
    var withoutDayMonthYear: String {
        Self.withoutDayMonthFormatter.string(from: self)
    }
    
    var day: Int {
        Calendar.current.component(.day, from: self)
    }
    
    var month: Int {
        Calendar.current.component(.month, from: self)
    }
}

extension Date {
    var startOfMonth: Date {
        let calendar = Calendar.current
        return calendar.date(from: calendar.dateComponents([.year, .month], from: self))!
    }
    
    var endOfMonth: Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .month, value: 1, to: startOfMonth)!
    }
    
    func isInSameMonth(date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.component(.month, from: self) == calendar.component(.month, from: date) &&
               calendar.component(.year, from: self) == calendar.component(.year, from: date)
    }
    
    var dayMonthString: String {
        let formatted = DateFormatter()
        formatted.dateFormat = "dd.MM"
        return formatted.string(from: self)
    }
    
    var fullDayAndMonthString: String {
        let formatted = DateFormatter()
        formatted.dateFormat = "dd MMMM"
        return formatted.string(from: self)
    }
}
