//
//  MainViewModel.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 13.01.26.
//

import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    private let fetchUseCase: FetchPaymentsUseCase
    private let setUseCase: SetPaymentUseCase
    
    init(fetchUseCase: FetchPaymentsUseCase, setUseCase: SetPaymentUseCase) {
        self.fetchUseCase = fetchUseCase
        self.setUseCase = setUseCase
    }
    
    @Published var payments: [Payment] = []
    
    func fetchPayments() {
        do {
            try fetchUseCase.execute(from: nil) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let success):
                    DispatchQueue.main.async {
                        self.payments = success
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func setPayment(payment: Payment) {
        do {
            try setUseCase.execute(payment: payment)
        } catch {
            print(error.localizedDescription)
        }
    }
}
