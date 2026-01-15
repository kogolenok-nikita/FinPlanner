//
//  Decimal.ext.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 15.01.26.
//

import Foundation

extension Decimal {
    var formattedWithoutDecimals: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.maximumFractionDigits = 0
        
        return formatter.string(from: self as NSNumber) ?? ""
    }
}
