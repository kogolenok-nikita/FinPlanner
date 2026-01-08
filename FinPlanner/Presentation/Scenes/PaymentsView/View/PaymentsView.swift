//
//  PaymentsView.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 30.12.25.
//

import SwiftUI

struct PaymentsView: View {
    @State var date: Date = .now
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack(alignment: .top) {
            HeaderView(page: HeaderViewContent(totalPrice: "25 500", title: "Платежи", date: date.withoutDayMonthYear, pageType: .paymentList), date: $date)
                .zIndex(1)
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 19) {
                    PaymentCard(path: $path)
                    PaymentCard(path: $path)
                }
                .padding(.top, 130)
                .padding(.bottom, 70)
            }
        }
        .padding(.horizontal, 20)
        .background(.appBlack)
    }
}
