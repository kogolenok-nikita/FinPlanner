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
    
    var payment: Payment
    
    init(payment: Payment) {
        self.payment = payment
    }
    
    func delete() {
        print("delete")
    }
    
    func updateNotification(_ newValue: Bool) {
        print("updateNotification")
    }
    
    func close() {
        print("close")
    }
    
    func deleteLastPayment() {
        print("deleteLastPayment")
    }
}
