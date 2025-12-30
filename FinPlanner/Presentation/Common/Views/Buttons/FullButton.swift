//
//  FullButton.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 29.12.25.
//

import SwiftUI

struct FullButton: View {
    var text: String
    var fillСolor: Color
    var textСolor: Color
    
    var body: some View {
        Button {
            //
        } label: {
            Text(text)
                .cygre(.regular, 12)
                .foregroundStyle(textСolor)
                .padding(.top, 12)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
                .background(fillСolor)
                .clipShape(.capsule)
        }
    }
}
