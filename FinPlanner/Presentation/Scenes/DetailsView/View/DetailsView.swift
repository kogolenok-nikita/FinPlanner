//
//  DetailsView.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 30.12.25.
//

import SwiftUI

struct DetailsView: View {
    @Binding var path: NavigationPath
    @StateObject var viewModel: DetailsViewModel
    
    init(path: Binding<NavigationPath>, viewModel: DetailsViewModel) {
        self._path = path
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            header
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: -8) {
                    Text("$ \(viewModel.payment.totalAmount.formattedWithoutDecimals)")
                        .cygre(.black, 27)
                        .foregroundStyle(.white)
                    Text(viewModel.payment.title)
                        .cygre(.black, 16)
                        .foregroundStyle(.appYellow)
                }
                .padding(.vertical, 30)
                
                VStack(alignment: .leading, spacing: 26) {
                    VStack(alignment: .leading, spacing: 17) {
                        HStack(spacing: 16) {
                            if viewModel.payment.type == .mountly {
                                InfoTagView(text: "$ \(viewModel.payment.remainingAmount.formattedWithoutDecimals)")
                                InfoTagView(text: "$ \(viewModel.payment.paymentAmount.formattedWithoutDecimals)")
                            }
                        }
                        
                        Text(viewModel.payment.description)
                            .cygre(.regular, 14)
                            .foregroundStyle(.appMint)
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Divider()
                            .background(.appGray)
                        PaymentStatus(paymentType: viewModel.payment.type, lastPay: viewModel.payment.lastPay, dueDate: viewModel.payment.dueDate)
                        
                        Divider()
                            .background(.appGray)
                        
                        HStack {
                            Text("Уведомление о платеже")
                                .cygre(.regular, 14)
                                .foregroundStyle(.appYellow)
                                .offset(y: -3)
                            Spacer()
                            RadioButtonView(isSeleceted: $viewModel.isNotificationSelected)
                        }
                        .padding(.horizontal, 10)
                    }
                }
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 18) {
                SolidButton(text: "Закрыть досрочно", solidСolor: .appYellow, textСolor: .appBlack, isFull: true) {
                    viewModel.close()
                }
                SolidButton(text: "Удалить последний платеж", solidСolor: .appYellow, textСolor: .appYellow) {
                    viewModel.deleteLastPayment()
                }
            }
            
        }
        .padding(.horizontal, 20)
        .background(.appBlack)
        .navigationBarHidden(true)
    }
}


extension DetailsView {
    var header: some View {
        HStack {
            Button {
                path.removeLast()
            } label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.appYellow)
                    .frame(width: 20, height: 20)
            }
            Spacer()
            Text("Детали платежа")
                .cygre(.black, 18)
                .foregroundStyle(.appYellow)
            Spacer()
            Button {
                viewModel.delete()
            } label: {
                Image(systemName: "trash")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.appYellow)
                    .frame(width: 20, height: 20)
            }
        }
    }
}
