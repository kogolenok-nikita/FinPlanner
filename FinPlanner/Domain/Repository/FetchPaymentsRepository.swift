//
//  FetchPaymentsRepository.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 14.01.26.
//

import Foundation

protocol FetchPaymentsRepository: AnyObject {
    func fetchPayments(form date: Date?, completion: (Result<[Payment], Error>) ->Void) throws
}
