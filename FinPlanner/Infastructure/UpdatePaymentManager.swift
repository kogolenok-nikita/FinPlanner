//
//  UpdatePaymentManager.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 23.01.26.
//

import Foundation
import CoreData

class UpdatePaymentManager: UpdatePaymentDataSource {
    let context = PersistentContainer.shared.persistentContainer.viewContext
    
    func updateNotification(payment: Payment, notificationIsOn: Bool) throws {
        if let currentPayment = searchPayment(paymentId: payment.id) {
            currentPayment.isNotificationEnabled = notificationIsOn
            try context.save()
        } else {
            throw NSError(domain: "Ошибка поиска по id \(payment.id)", code: 1)
        }
    }
    
    func closePayment(payment: Payment) throws {
        if let currentPayment = searchPayment(paymentId: payment.id) {
            currentPayment.isClose = true
            try context.save()
        } else {
            throw NSError(domain: "Ошибка поиска по id \(payment.id)", code: 1)
        }
    }
    
    func deleteLastPayment(payment: Payment) throws {
        if let currentPayment = searchPayment(paymentId: payment.id) {
            currentPayment.lastPay = Date().minusMoths(value: 1)
            try context.save()
        } else {
            throw NSError(domain: "Ошибка поиска по id \(payment.id)", code: 1)
        }
    }
    
    private func searchPayment(paymentId: String) -> PaymentEntity? {
        let request = PaymentEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", paymentId)
        
        if let payments = try? context.fetch(request), let currentPayment = payments.first {
            return currentPayment
        }
        return nil
    }
}
