//
//  DeletePaymentManager.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 23.01.26.
//

import Foundation
import CoreData

class DeletePaymentManager: DeletePaymentDataSource {
    let context = PersistentContainer.shared.persistentContainer.viewContext
    
    func deletePayment(payment: Payment) throws {
        let request = PaymentEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", payment.id)
        
        if let payments = try? context.fetch(request), let currentPayment = payments.first {
            context.delete(currentPayment)
            try context.save()
        }
    }
}
