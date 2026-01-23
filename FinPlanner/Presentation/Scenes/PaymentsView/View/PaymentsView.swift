//
//  PaymentsView.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 30.12.25.
//

import SwiftUI

struct PaymentsView: View {
    @Binding var path: NavigationPath
    @StateObject var viewModel = Assembly.createPaymentsView()
    
    var body: some View {
        ZStack(alignment: .top) {
            HeaderView(page: HeaderViewContent(totalPrice: viewModel.totalAmount.formattedWithoutDecimals, title: "Платежи", date: viewModel.date.withoutDayMonthYear, pageType: .paymentList), date: $viewModel.date)
                .zIndex(1)
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 19) {
                    ForEach(viewModel.payments) { payment in
                        PaymentCard(isPay: true, path: $path, payment: payment) {
                            //
                        }
                    }
                }
                .padding(.top, 130)
                .padding(.bottom, 70)
            }
        }
        .padding(.horizontal, 20)
        .background(.appBlack)
        .onAppear {
            viewModel.fetchPayments()
        }
    }
}
