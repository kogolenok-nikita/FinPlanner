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
            var lastPayDate: Date? = nil
            if payType == .mountly {
                lastPayDate = Date.now
            }
            
            try createUseCase.execute(payment: Payment(id: UUID().uuidString,
                                                       type: payType,
                                                       title: paymentName,
                                                       description: description,
                                                       paymentAmount: Decimal(string: paymentAmount) ?? 0,
                                                       totalAmount: Decimal(string: totalAmount) ?? 0,
                                                       dueDay: date.day,
                                                       dueDate: date,
                                                       isNotificationEnable: isNotificationSelected,
                                                       createdAt: .now,
                                                       lastPay: lastPayDate,
                                                       remainingAmount: Decimal(string: totalAmount) ?? .zero))
            isAdded.toggle()
        } catch {
            print(error.localizedDescription)
        }
    }
}
