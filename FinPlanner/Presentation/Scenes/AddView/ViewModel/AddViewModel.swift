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
    
    @Published var payType: PayType = .mountly
    @Published var paymentName: String = ""
    @Published var description: String = ""
    @Published var paymentAmount: String = ""
    @Published var totalAmount: String = ""
    @Published var date: Date = .now
    @Published var isNotificationSelected = false
    @Published var isShowCalendar = false
    @Published var isAdded: Bool = false
    
    func createNewPayment() {
        do {
            try createUseCase.execute(payment: Payment(id: UUID().uuidString,
                                                       type: payType,
                                                       title: paymentName,
                                                       description: description,
                                                       paymentAmount: Decimal(string: paymentAmount) as NSDecimalNumber?,
                                                       totalAmount: Decimal(string: totalAmount) as NSDecimalNumber?,
                                                       dueDay: date.day,
                                                       dueDate: date,
                                                       isNotificationEnable: isNotificationSelected,
                                                       createdAt: .now,
                                                       lastPay: nil))
            isAdded.toggle()
        } catch {
            print(error.localizedDescription)
        }
    }
}
