//
//  DeletePaymentUseCase.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 22.01.26.
//

import Foundation

protocol DeletePaymentUseCase: AnyObject {
    func execute(payment: Payment) throws
}

class DeletePaymentUseCaseImpl: DeletePaymentUseCase {
    private let repository: DeletePaymentRepository
    
    init(repository: DeletePaymentRepository) {
        self.repository = repository
    }
    
    func execute(payment: Payment) throws {
        try repository.deletePayment(payment: payment)
    }
}
