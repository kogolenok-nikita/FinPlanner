//
//  UpdatePaymentUseCase.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 22.01.26.
//

import Foundation

protocol UpdatePaymentUseCase: AnyObject {
    func execute(update forUpdate: Payment, notificationIsOn: Bool) throws
    func execute(close forClose: Payment) throws
    func execute(delete forDelete: Payment) throws
}

class UpdatePaymentUseCaseImpl: UpdatePaymentUseCase {
    private let repository: UpdatePaymentRepository
    
    init(repository: UpdatePaymentRepository) {
        self.repository = repository
    }
    
    func execute(update forUpdate: Payment, notificationIsOn: Bool) throws {
        try repository.updateNotification(payment: forUpdate, notificationIsOn: notificationIsOn)
    }
    
    func execute(close forClose: Payment) throws {
        try repository.closePayment(payment: forClose)
    }
    
    func execute(delete forDelete: Payment) throws {
        try repository.deleteLastPayment(payment: forDelete)
    }
}
