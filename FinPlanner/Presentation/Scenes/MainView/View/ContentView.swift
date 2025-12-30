//
//  ContentView.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 29.12.25.
//

import SwiftUI

struct ContentView: View {
    @State var isShowAddView: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            HeaderView(page: HeaderViewContent(totalPrice: "723 434 $", title: "Сумма долга", date: "15 декабря", pageType: .main), action: {
                isShowAddView.toggle()
            })
                .zIndex(1)
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 19) {
                    MainViewContentHeader()
                    
                    VStack(alignment: .leading, spacing: 25) {
                        PaymentCard()
                        PaymentCard()
                        PaymentCard()
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
    }
}
