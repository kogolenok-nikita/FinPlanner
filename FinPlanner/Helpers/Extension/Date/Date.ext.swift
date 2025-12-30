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
    
    var dayMonthYear: String {
        Self.dayMonthFormatter.string(from: self)
    }
    
    var day: Int {
        Calendar.current.component(.day, from: self)
    }
}
