//
//  FetchPaymentRepositoryImpl.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 14.01.26.
//

import Foundation

class FetchPaymentRepositoryImpl: FetchPaymentsRepository {
    private let dataSource: FetchPaymentDataSource
    
    init(dataSource: FetchPaymentDataSource) {
        self.dataSource = dataSource
    }
    
    func fetchPayments(form date: Date?, completion: (Result<[Payment], any Error>) -> Void) throws {
        try dataSource.fetchPayments(date: date, completion: completion)
    }
}
