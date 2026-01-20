//
//  SetPaymentRepositoryImpl.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 15.01.26.
//

import Foundation

class SetPaymentRepositoryImpl: SetPaymentRepository {
    private let dataSource: SetPaymentDataSource
    
    init(dataSource: SetPaymentDataSource) {
        self.dataSource = dataSource
    }
    
    func setPayment(payment: Payment) throws {
        try dataSource.setPayment(payment: payment)
    }
}
