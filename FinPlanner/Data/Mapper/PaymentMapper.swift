//
//  PaymentMapper.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 13.01.26.
//

import Foundation
import CoreData

struct PaymentMapper {
    static func toDomain(from entity: PaymentEntity) -> Payment {
        let payment = Payment(id: entity.id ?? "",
                              type: PayType(rawValue: Int(entity.type)) ?? .mountly,
                              title: entity.title ?? "",
                              description: entity.descriptionText ?? "",
                              paymentAmount: entity.paymentAmount?.decimalValue ?? 0,
                              totalAmount: entity.totalAmount?.decimalValue ?? 0,
                              dueDay: Int(entity.dueDay),
                              dueDate: entity.dueDate,
                              isNotificationEnable: entity.isNotificationEnabled,
                              createdAt: entity.createdAt ?? .now,
                              lastPay: entity.lastPay,
                              remainingAmount: entity.remainingAmount?.decimalValue ?? 0,
                              closeDate: entity.closeDate)
        return payment
    }
    
    static func toEntity(from: Payment, context: NSManagedObjectContext) -> PaymentEntity {
        let entity = PaymentEntity(context: context)
        entity.id = from.id
        entity.type = Int16(from.type.rawValue) 
        entity.title = from.title
        entity.descriptionText = from.description
        entity.paymentAmount = NSDecimalNumber(decimal: from.paymentAmount)
        entity.dueDay = Int16(from.dueDay ?? 0)
        entity.dueDate = from.dueDate
        entity.totalAmount = NSDecimalNumber(decimal: from.totalAmount)
        entity.isNotificationEnabled = from.isNotificationEnable
        entity.createdAt = from.createdAt
        entity.lastPay = from.lastPay
        entity.remainingAmount = NSDecimalNumber(decimal: from.remainingAmount)
        entity.closeDate = from.closeDate
        return entity
    }
}
