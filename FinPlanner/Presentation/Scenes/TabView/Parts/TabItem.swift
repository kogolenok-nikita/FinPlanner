//
//  TabItem.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 30.12.25.
//

import SwiftUI

struct TabItem: View {
    var image: String
    var text: String
    var pageType: TabPage
    @Binding var selected: TabPage
    
    var body: some View {
        Button {
            selected = pageType
        } label: {
            VStack {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                Text(text)
                    .cygre(.light, 10)
            }
            .foregroundStyle(pageType == selected ? .appBlack : .appYellow)
            .padding(.vertical, 6)
            .padding(.horizontal, 17)
            .background(pageType == selected ? .appYellow : .clear)
            .clipShape(RoundedRectangle(cornerRadius: 35))
        }
    }
}
