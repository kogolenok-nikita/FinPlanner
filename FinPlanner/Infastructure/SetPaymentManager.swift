//
//  SetPaymentManager.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 15.01.26.
//

import Foundation
import CoreData

class SetPaymentManager: SetPaymentDataSource {
    let context = PersistentContainer.shared.persistentContainer.viewContext
    
    func setPayment(payment: Payment) throws {
        let request = PaymentEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", payment.id)
        
        let payments = try context.fetch(request)
        if let contextPayment = payments.first {
            contextPayment.lastPay = .now
            
            if contextPayment.type == 0 {
                var remainingAmount = contextPayment.remainingAmount?.decimalValue ?? .zero
                let paymentAmount = contextPayment.paymentAmount?.decimalValue ?? .zero
                remainingAmount -= paymentAmount
                
                if remainingAmount < 0 {
                    contextPayment.remainingAmount = .zero
                } else {
                    contextPayment.remainingAmount = NSDecimalNumber(decimal: remainingAmount)
                }
                
            } else {
                contextPayment.remainingAmount = .zero
                contextPayment.isNotificationEnabled = false
            }
            
            try context.save()
        }
    }
}
