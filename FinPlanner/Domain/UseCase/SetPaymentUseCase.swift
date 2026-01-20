//
//  SetPaymentUseCase.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 15.01.26.
//

import Foundation

protocol SetPaymentUseCase: AnyObject {
    func execute(payment: Payment) throws
}

class SetPaymentUseCaseImpl: SetPaymentUseCase {
    private let repository: SetPaymentRepository
    
    init(repository: SetPaymentRepository) {
        self.repository = repository
    }
    
    func execute(payment: Payment) throws {
        try repository.setPayment(payment: payment)
    }
}
