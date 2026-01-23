//
//  DeletePaymentDataSource.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 22.01.26.
//

import Foundation

protocol DeletePaymentDataSource: AnyObject {
    func deletePayment(payment: Payment) throws
}
