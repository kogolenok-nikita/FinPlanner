//
//  SolidButton.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 29.12.25.
//

import SwiftUI

struct SolidButton: View {
    var text: String
    var solidСolor: Color
    var backgroundСolor: Color = .appBlack
    var textСolor: Color
    var isFull: Bool = false
    var action: (() -> Void)?
    
    var body: some View {
        Button {
            action?()
        } label: {
            Text(text)
                .cygre(.regular, 12)
                .padding(.top, 12)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
                .foregroundStyle(isFull ? .appBlack : textСolor)
                .background(isFull ? solidСolor : backgroundСolor)
                .clipShape(Capsule())
                .overlay {
                    Capsule()
                        .stroke(solidСolor, lineWidth: 1)
                }
        }
    }
}
