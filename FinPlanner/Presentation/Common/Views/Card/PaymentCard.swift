//
//  PaymentCard.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 29.12.25.
//

import SwiftUI

struct PaymentCard: View {
    @State var isPay: Bool
    @Binding var path: NavigationPath
    var payment: Payment
    var action: () -> Void
    var checkIsPay: Bool {
        !isPay && !(payment.lastPay?.isInSameMonth(date: Date.now) ?? false)
    }
    
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
                    PaymentStatus(paymentType: payment.type, lastPay: payment.lastPay, dueDate: payment.dueDate, isShowLabel: false)
                }
            }
            HStack(spacing: 4) {
                if checkIsPay {
                    FullButton(text: "Оплатить", fillСolor: .appBlack, textСolor: .white) {
                        action()
                        isPay.toggle()
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
        .background(checkIsPayColor())
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
    
    func checkIsPayColor() -> Color {
        if isPay || payment.lastPay?.isInSameMonth(date: Date.now) ?? false {
            return .appMint
        }
        return .appRed
    }
}
