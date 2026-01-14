//
//  FetchPaymentsUseCase.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 14.01.26.
//

import Foundation

protocol FetchPaymentsUseCase: AnyObject {
    func execute(from date: Date?, completion: (Result<[Payment], Error>) ->Void) throws
}

class FetchPaymentsUseCaseImpl: FetchPaymentsUseCase {
    private let repository: FetchPaymentsRepository
    
    init(repository: FetchPaymentsRepository) {
        self.repository = repository
    }
    
    func execute(from date: Date?, completion: (Result<[Payment], any Error>) -> Void) throws {
        try repository.fetchPayments(form: date, completion: completion)
    }
}
