//
//  PaymentsViewModel.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 15.01.26.
//

import Foundation
import Combine

@MainActor
class PaymentsViewModel: ObservableObject {
    @Published var payments: [Payment] = []
    @Published var date: Date = .now {
        didSet {
            fetchPayments()
        }
    }
    @Published var totalAmount: Decimal = .zero
    
    private let fetchUseCase: FetchPaymentsUseCase
    
    init(fetchUseCase: FetchPaymentsUseCase) {
        self.fetchUseCase = fetchUseCase
    }
    
    func fetchPayments() {
        do {
            try fetchUseCase.execute(from: date) { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success(let success):
                    self.payments = success
                    self.totalAmount = success.reduce(0) {
                        $0 + $1.remainingAmount
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
