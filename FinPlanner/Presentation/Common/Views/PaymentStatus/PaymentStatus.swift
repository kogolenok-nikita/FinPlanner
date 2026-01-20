//
//  PaymentStatus.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 20.01.26.
//

import SwiftUI

struct PaymentStatus: View {
    var paymentType: PayType
    var lastPay: Date?
    var dueDate: Date?
    var isShowLabel: Bool = true
    
    var body: some View {
        HStack {
            switch paymentType {
            case .mountly:
                if isShowLabel {
                    Text("Ближайший платеж")
                        .cygre(.regular, 14)
                        .foregroundStyle(.appYellow)
                        .offset(y: -3)
                    Spacer()
                }
                
                
                if let lastPay, lastPay.isInSameMonth(date: .now) {
                    HStack(spacing: 4) {
                        Text("оплачен")
                            .cygre(.regular, 12)
                        Text(lastPay.dayMonthString)
                            .cygre(.black, 12)
                            
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 4)
                    .background(.appYellow)
                    .clipShape(Capsule())
                } else {
                    HStack(spacing: 4) {
                        Text("оплатить до")
                            .cygre(.regular, 12)
                        Text("\(dueDate?.day ?? 0).\(Date().month)")
                            .cygre(.black, 12)
                            
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 4)
                    .background(.appYellow)
                    .clipShape(Capsule())
                }
                
            case .oneTime:
                if isShowLabel {
                    Text("Оплатить до")
                        .cygre(.regular, 14)
                        .foregroundStyle(.appYellow)
                        .offset(y: -3)
                    Spacer()
                }
                
                HStack(spacing: 4) {
                    Text(dueDate?.dayMonthString ?? "")
                        .cygre(.black, 12)
                        
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 4)
                .background(.appYellow)
                .clipShape(Capsule())
            }
            
        }
        .padding(.horizontal, 10)
    }
}
