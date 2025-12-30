//
//  MainTabView.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 29.12.25.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selectionPage: TabPage = .main
//    @State var selectionPage: TabPage = .paymentList
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectionPage) {
                ContentView()
                    .tag(TabPage.main)
                PaymentsView()
                    .tag(TabPage.paymentList)
            }
            
            HStack(spacing: 62) {
                TabItem(image: "house", text: "Главная", pageType: .main, selected: $selectionPage)
                TabItem(image: "list.bullet.rectangle.portrait", text: "Платежи", pageType: .paymentList, selected: $selectionPage)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 20)
            .padding(.bottom, 1)
            .background(.appBlack)
        }
    }
}

#Preview {
    MainTabView()
}
