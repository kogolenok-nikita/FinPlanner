//
//  DeletePaymentRepositoryImpl.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 22.01.26.
//

import Foundation

class DeletePaymentRepositoryImpl: DeletePaymentRepository {
    private let dataSource: DeletePaymentDataSource
    
    init(dataSource: DeletePaymentDataSource) {
        self.dataSource = dataSource
    }
    
    func deletePayment(payment: Payment) throws {
        try dataSource.deletePayment(payment: payment)
    }
}
