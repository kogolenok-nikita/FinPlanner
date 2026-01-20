//
//  ContentView.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 29.12.25.
//

import SwiftUI

struct ContentView: View {
    @State var isShowAddView: Bool = false
    @State var payType: PayType = .mountly
    
    @StateObject var viewModel = Assembly.createMainViewModel()
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack(alignment: .top) {
            HeaderView(page: HeaderViewContent(totalPrice: viewModel.totalRemainderAmount.formattedWithoutDecimals, title: "Сумма долга", date: Date.now.fullDayAndMonthString, pageType: .main), action: {
                isShowAddView.toggle()
            }, date: .constant(.now))
                .zIndex(1)
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 19) {
                    MainViewContentHeader(payType: $payType, totalMonthAmount: $viewModel.oneMounthRemainderAmount, totalOneTimeAmount: $viewModel.oneTimeRemainderAmount)
                    
                    VStack(alignment: .leading, spacing: 25) {
                        switch payType {
                        case .mountly:
                            ForEach(viewModel.payments.filter { $0.type == .mountly }) { item in
                                PaymentCard(path: $path, payment: item) {
                                    viewModel.setPayment(payment: item)
                                }
                            }
                        case .oneTime:
                            ForEach(viewModel.payments.filter { $0.type == .oneTime }) { item in
                                PaymentCard(path: $path, payment: item) {
                                    viewModel.setPayment(payment: item)
                                }
                            }
                        }
                    }
                }
                .padding(.top, 130)
                .padding(.bottom, 70)
            }
        }
        .padding(.horizontal, 20)
        .background(.appBlack)
        .sheet(isPresented: $isShowAddView) {
            AddView()
        }
        .onAppear {
            viewModel.fetchPayments()
        }
    }
}
