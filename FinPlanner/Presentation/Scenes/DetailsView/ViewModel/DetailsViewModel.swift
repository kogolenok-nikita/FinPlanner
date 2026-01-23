//
//  DetailsViewModel.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 20.01.26.
//

import Foundation
import Combine

class DetailsViewModel: ObservableObject {
    @Published var isNotificationSelected: Bool = false {
        willSet {
            updateNotification(newValue)
        }
    }
    
    private let deleteUseCase: DeletePaymentUseCase
    private let updateUseCase: UpdatePaymentUseCase
    var payment: Payment
    
    init(payment: Payment, deleteUseCase: DeletePaymentUseCase, updateUseCase: UpdatePaymentUseCase) {
        self.payment = payment
        self.deleteUseCase = deleteUseCase
        self.updateUseCase = updateUseCase
        self.isNotificationSelected = payment.isNotificationEnable
    }
    
    func deletePayment() {
        do {
            try deleteUseCase.execute(payment: payment)
        } catch {
            print(error)
        }
    }
    
    func updateNotification(_ newValue: Bool) {
        do {
            try updateUseCase.execute(update: payment, notificationIsOn: newValue)
        } catch {
            print(error)
        }
    }
    
    func closePayment() {
        do {
            try updateUseCase.execute(close: payment)
        } catch {
            print(error)
        }
    }
    
    func deleteLastPayment() {
        do {
            try updateUseCase.execute(delete: payment)
        } catch {
            print(error)
        }
    }
}
