//
//  FetchPaymentDataSource.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 14.01.26.
//

import Foundation

protocol FetchPaymentDataSource {
    func fetchPayments(date: Date?, completion: (Result<[Payment], Error>) -> Void) throws
}
