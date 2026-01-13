//
//  Payment.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 8.01.26.
//

import Foundation

struct Payment: Identifiable {
    let id: String
    let type: PayType
    let title: String
    var description: String
    var paymentAmount: Double
    var totalAmount: Double
    var dueDay: Int?
    var dueDate: Date?
    var isNotificationEnable: Bool
    var createdAt: Date
}
