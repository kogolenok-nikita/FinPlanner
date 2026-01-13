//
//  AddViewModel.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 13.01.26.
//

import SwiftUI
import Combine

class AddViewModel: ObservableObject {
    private let createUseCase: CreatePaymentUseCase
    
    init(createUseCase: CreatePaymentUseCase) {
        self.createUseCase = createUseCase
    }
    
    @Published var payment: Payment?
    
    func createNewPayment() {
        do {
            try createUseCase.execute(payment: Payment(id: UUID().uuidString,
                                                       type: .mountly,
                                                       title: "qdqdqe",
                                                       description: "qfqeqc",
                                                       paymentAmount: 10,
                                                       totalAmount: 20,
                                                       isNotificationEnable: true,
                                                       createdAt: .now))
        } catch {
            print(error.localizedDescription)
        }
    }
}
