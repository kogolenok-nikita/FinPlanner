//
//  DeletePaymentRepository.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 22.01.26.
//

import Foundation

protocol DeletePaymentRepository: AnyObject {
    func deletePayment(payment: Payment) throws
}
