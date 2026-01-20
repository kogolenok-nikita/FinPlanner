//
//  PaymentCard.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 29.12.25.
//

import SwiftUI

struct PaymentCard: View {
    @Binding var path: NavigationPath
    var payment: Payment
    var action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 5) {
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(payment.title)
                            .cygre(.black, 24)
                        HStack(spacing: 5) {
                            Text("$ \(payment.remainingAmount.formattedWithoutDecimals)")
                                .cygre(.black, 12)
                            Text("/ Остасок")
                                .cygre(.regular, 12)
                        }
                    }
                    Text(payment.description)
                        .cygre(.regular, 14)
                }
                HStack {
                    HStack(spacing: 5) {
                        if payment.type == .mountly {
                            Text("$ \(payment.paymentAmount.formattedWithoutDecimals)")
                                .cygre(.black, 18)
                            Text("/ Месяц")
                                .cygre(.regular, 18)
                        } else {
                            Text("$ \(payment.remainingAmount.formattedWithoutDecimals)")
                                .cygre(.black, 18)
                        }
                    }
                    Spacer()
                    HStack(spacing: 5) {
                        Text("оплатить до")
                            .cygre(.light, 12)
                        switch payment.type {
                        case .mountly:
                            Text("\(payment.dueDay ?? 0).\(Date.now.month)")
                                .cygre(.black, 12)
                        case .oneTime:
                            Text("\(payment.dueDate?.dayMonthString ?? "")")
                                .cygre(.black, 12)
                        }
                    }
                    .padding(.horizontal, 11)
                    .padding(.bottom, 4)
                    .background(.appBlack)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                }
            }
            HStack(spacing: 4) {
                if !(payment.lastPay?.isInSameMonth(date: Date.now) ?? false) {
                    FullButton(text: "Оплатить", fillСolor: .appBlack, textСolor: .white) {
                        action()
                    }
                }
                
                SolidButton(text: "Подробнее", solidСolor: .appBlack, backgroundСolor: .clear, textСolor: .appBlack) {
                    path.append(NavigationPage.details(payment: payment))
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.top, 10)
        .padding(.bottom, 20)
        .background(payment.lastPay?.isInSameMonth(date: Date.now) ?? false ? .appMint : .appRed)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}
