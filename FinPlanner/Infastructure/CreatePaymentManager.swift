//
//  CreatePaymentManager.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 13.01.26.
//

import Foundation
import CoreData

class CreatePaymentManager: CreatePaymentDataSource {
    let context = PersistentContainer.shared.persistentContainer.viewContext
    
    func createNewPayment(payment: Payment) throws {
        let _ = PaymentMapper.toEntity(from: payment, context: context)
        try context.save()
    }
}

