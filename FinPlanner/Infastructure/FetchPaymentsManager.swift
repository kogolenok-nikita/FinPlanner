//
//  FetchPaymentsManager.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 14.01.26.
//

import Foundation
import CoreData

class FetchPaymentsManager: FetchPaymentDataSource {
    let context = PersistentContainer.shared.persistentContainer.viewContext
    
    func fetchPayments(date: Date?, completion: (Result<[Payment], any Error>) -> Void) throws {
        let request = PaymentEntity.fetchRequest()
        if let date {
            let predicate = NSPredicate(format: "lastPay >= %@ AND lastPay < %@",
                                        date.startOfMonth as NSDate,
                                        date.endOfMonth as NSDate)
            request.predicate = predicate
        }
        request.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: false)]
        let payments = try context.fetch(request)
        
        let domainPayments = payments.map { item in
            PaymentMapper.toDomain(from: item)
        }
        
        completion(.success(domainPayments))
    }
}
