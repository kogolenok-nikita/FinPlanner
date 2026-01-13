//
//  CreatePaymentRepository.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 13.01.26.
//

import Foundation

protocol CreatePaymentRepository: AnyObject {
    func createPayment(payment: Payment) throws
}
