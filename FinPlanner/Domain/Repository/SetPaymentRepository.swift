//
//  SetPaymentRepository.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 15.01.26.
//

import Foundation

protocol SetPaymentRepository {
    func setPayment(payment: Payment) throws
}
