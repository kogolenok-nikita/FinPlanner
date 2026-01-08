//
//  MainTabView.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 29.12.25.
//

import SwiftUI

struct MainTabView: View {
    @State var selectionPage: TabPage = .main
    @Binding var path: NavigationPath

    init(path: Binding<NavigationPath>) {
        UITabBar.appearance().isHidden = true
        self._path = path
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectionPage) {
                ContentView(path: $path)
                    .tag(TabPage.main)
                PaymentsView(path: $path)
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

