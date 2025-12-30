//
//  RadioButtonView.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 30.12.25.
//

import SwiftUI

struct RadioButtonView: View {
    @Binding var isSeleceted: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.appYellow, lineWidth: 2)
                .frame(width: 26)
            if isSeleceted {
                Circle()
                    .fill(.appYellow)
                    .frame(width: 12)
            }
        }
        .onTapGesture {
            isSeleceted.toggle()
        }
    }
}
