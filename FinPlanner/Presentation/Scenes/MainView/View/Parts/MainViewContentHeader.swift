//
//  MainViewContentHeader.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 29.12.25.
//

import SwiftUI

struct MainViewContentHeader: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Долги")
                    .cygre(.black, 16)
                    .foregroundStyle(.appYellow)
                Spacer()
                HStack(spacing: 16) {
                    Button {
                        //
                    } label: {
                        Text("ежемесячно")
                            .cygre(.black, 12)
                            .foregroundStyle(.white)
                    }
                    
                    Button {
                        //
                    } label: {
                        Text("разово")
                            .cygre(.light, 12)
                            .foregroundStyle(.white)
                    }


                }
            }
            HStack(spacing: 2) {
                Text("$ 25 500 /")
                    .cygre(.black, 14)
                Text("Каждый месяц")
                    .cygre(.regular, 14)
            }
            .foregroundStyle(.white)
        }
    }
}
