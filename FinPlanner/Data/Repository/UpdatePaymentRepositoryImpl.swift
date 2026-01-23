//
//  UpdatePaymentRepositoryImpl.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 22.01.26.
//

import Foundation

class UpdatePaymentRepositoryImpl: UpdatePaymentRepository {
    private let dataSource: UpdatePaymentDataSource
    
    init(dataSource: UpdatePaymentDataSource) {
        self.dataSource = dataSource
    }
    
    func updateNotification(payment: Payment, notificationIsOn: Bool) throws {
        try dataSource.updateNotification(payment: payment, notificationIsOn: notificationIsOn)
    }
    
    func closePayment(payment: Payment) throws {
        try dataSource.closePayment(payment: payment)
    }
    
    func deleteLastPayment(payment: Payment) throws {
        try dataSource.deleteLastPayment(payment: payment)
    }
}
