//
//  AddView.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 30.12.25.
//

import SwiftUI

struct AddView: View {
    @StateObject var viewModel: AddViewModel = Assembly.createAddViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 27) {
            Text("Добавить платеж")
                .cygre(.black, 18)
                .foregroundStyle(.appYellow)
            
            if !viewModel.isAdded {
                addViewContent
            } else {
                successViewContent
            }

        }
        .padding(.horizontal, 10)
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        .background(.appBlack)
    }
}

// MARK: - addViewContent
extension AddView {
    var addViewContent: some View {
        VStack(alignment: .center, spacing: 27) {
            VStack(alignment: .leading, spacing: 25) {
                HStack(spacing: 23) {
                    SolidButton(text: "Каждый месяц", solidСolor: .appYellow, textСolor: .appYellow, isFull: viewModel.payType == .mountly) {
                        viewModel.payType = .mountly
                    }
                    SolidButton(text: "Разово", solidСolor: .appYellow, textСolor: .appYellow, isFull: viewModel.payType == .oneTime) {
                        viewModel.payType = .oneTime
                    }
                }
                
                
                switch viewModel.payType {
                case .mountly:
                    HStack(spacing: 4) {
                        DatePicker("", selection: $viewModel.date, displayedComponents: [.date])
                            .frame(width: 25)
                            .clipped()
                            .overlay {
                                Text("\(viewModel.date.day)")
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
                        DatePicker("", selection: $viewModel.date, displayedComponents: [.date])
                            .frame(width: 150)
                            .clipped()
                            .overlay {
                                Text(viewModel.date.dayMonthYear)
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
                FieldView(placeholder: "Название платежа", text: $viewModel.paymentName)
                
                switch viewModel.payType {
                case .mountly:
                    HStack(spacing: 10) {
                        FieldView(placeholder: "Общая сумма", text: $viewModel.totalAmount, isPriceField: true)
                        FieldView(placeholder: "Ежемесячный платеж", text: $viewModel.paymentAmount, isPriceField: true)
                    }
                case .oneTime:
                    FieldView(placeholder: "Общая сумма", text: $viewModel.totalAmount, isPriceField: true)
                }
                
                FieldView(placeholder: "Описание", text: $viewModel.description, isTextField: false)
            }
            
            HStack {
                Text("Уведомление о платеже")
                    .cygre(.regular, 14)
                    .foregroundStyle(.appYellow)
                    .offset(y: -3)
                Spacer()
                RadioButtonView(isSeleceted: $viewModel.isNotificationSelected)
            }
            .padding(.horizontal, 10)
            
            Spacer()
            FullButton(text: "Добавить", fillСolor: .appYellow, textСolor: .appBlack) {
                viewModel.createNewPayment()
            }
        }
    }
}

// MARK: - successViewContent
extension AddView {
    var successViewContent: some View {
        VStack {
            Spacer()
            VStack(spacing: 55) {
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 127, height: 127)
                    .foregroundStyle(.appYellow)
                Text("Платеж добавлен")
                    .cygre(.black, 22)
                    .foregroundStyle(.appYellow)
            }
            Spacer()
        }
    }
}
