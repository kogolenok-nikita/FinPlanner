//
//  PaymentCard.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 29.12.25.
//

import SwiftUI

struct PaymentCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 5) {
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Долг по кредиту")
                            .cygre(.black, 24)
                        HStack(spacing: 5) {
                            Text("$ 32 500")
                                .cygre(.black, 12)
                            Text("/ Остасок")
                                .cygre(.regular, 12)
                        }
                    }
                    Text("This course will be your personal guide to be an UI")
                        .cygre(.regular, 14)
                }
                HStack {
                    HStack(spacing: 5) {
                        Text("$ 1 200")
                            .cygre(.black, 18)
                        Text("/ Месяц")
                            .cygre(.regular, 18)
                    }
                    Spacer()
                    HStack(spacing: 5) {
                        Text("оплатить до")
                            .cygre(.light, 12)
                        Text("21.12")
                            .cygre(.black, 12)
                    }
                    .padding(.horizontal, 11)
                    .padding(.bottom, 4)
                    .background(.appBlack)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                }
            }
            HStack(spacing: 4) {
                FullButton(text: "Оплатить", fillСolor: .appBlack, textСolor: .white)
                SolidButton(text: "Подробнее", solidСolor: .appBlack, backgroundСolor: .clear, textСolor: .appBlack)
            }
        }
        .padding(.horizontal, 12)
        .padding(.top, 10)
        .padding(.bottom, 20)
        .background(.appRed)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}
