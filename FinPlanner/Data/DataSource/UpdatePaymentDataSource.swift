//
//  UpdatePaymentDataSource.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 22.01.26.
//

import Foundation

protocol UpdatePaymentDataSource: AnyObject {
    func updateNotification(payment: Payment, notificationIsOn: Bool) throws
    func closePayment(payment: Payment) throws
    func deleteLastPayment(payment: Payment) throws
}
