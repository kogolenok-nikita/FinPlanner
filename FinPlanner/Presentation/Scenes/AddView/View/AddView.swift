//
//  AddView.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 30.12.25.
//

import SwiftUI

enum PayType {
    case mountly
    case oneTime
}

struct AddView: View {
    @State var nameText: String = ""
    @State var isNotificationSelected = false
    @State var payType: PayType = .mountly
    @State var date: Date = .now
    @State var isShowCalendar = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 27) {
            
            VStack(alignment: .leading, spacing: 25) {
                VStack(spacing: 25) {
                    Text("Добавить платеж")
                        .cygre(.black, 18)
                        .foregroundStyle(.appYellow)
                    HStack(spacing: 23) {
                        SolidButton(text: "Каждый месяц", solidСolor: .appYellow, textСolor: .appYellow, isFull: payType == .mountly) {
                            payType = .mountly
                        }
                        SolidButton(text: "Разово", solidСolor: .appYellow, textСolor: .appYellow, isFull: payType == .oneTime) {
                            payType = .oneTime
                        }
                    }
                }
                
                switch payType {
                case .mountly:
                    HStack(spacing: 4) {
                        DatePicker("", selection: $date, displayedComponents: [.date])
                            .frame(width: 25)
                            .clipped()
                            .overlay {
                                Text("\(date.day)")
                                    .underline()
                                    .cygre(.black, 16)
                                    .foregroundStyle(.appMint)
                                    .frame(width: 27)
                                    .padding(.vertical, 4)
                                    .background(.appBlack)
                                    .allowsHitTesting(false)
                            }
                        
                        Text("числа")
                            .cygre(.light, 14)
                            .foregroundStyle(.appMint)
                    }
                case .oneTime:
                    HStack(spacing: 4) {
                        Text("До")
                            .cygre(.light, 14)
                            .foregroundStyle(.appMint)
                        DatePicker("", selection: $date, displayedComponents: [.date])
                            .frame(width: 150)
                            .clipped()
                            .overlay {
                                Text(date.dayMonthYear)
                                    .underline()
                                    .cygre(.black, 16)
                                    .foregroundStyle(.appMint)
                                    .frame(width: 152)
                                    .padding(.vertical, 4)
                                    .background(.appBlack)
                                    .allowsHitTesting(false)
                            }
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 12) {
                FieldView(placeholder: "Название платежа", text: $nameText)
                
                switch payType {
                case .mountly:
                    HStack(spacing: 10) {
                        FieldView(placeholder: "Общая сумма", text: $nameText)
                        FieldView(placeholder: "Ежемесячный платеж", text: $nameText)
                    }
                case .oneTime:
                    FieldView(placeholder: "Общая сумма", text: $nameText)
                }
                
                FieldView(placeholder: "Описание", text: $nameText, isTextField: false)
            }
            
            HStack {
                Text("Уведомление о платеже")
                    .cygre(.regular, 14)
                    .foregroundStyle(.appYellow)
                    .offset(y: -3)
                Spacer()
                RadioButtonView(isSeleceted: $isNotificationSelected)
            }
            .padding(.horizontal, 10)
            
            Spacer()
            FullButton(text: "Добавить", fillСolor: .appYellow, textСolor: .appBlack)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 20)
        .background(.appBlack)
    }
}

#Preview {
    AddView()
}
