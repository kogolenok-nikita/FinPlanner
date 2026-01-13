//
//  CreatePaymentDataSource.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 13.01.26.
//

import Foundation

protocol CreatePaymentDataSource {
    func createNewPayment(payment: Payment) throws
}
