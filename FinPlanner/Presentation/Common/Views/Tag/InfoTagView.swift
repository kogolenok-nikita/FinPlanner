//
//  InfoTagView.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 30.12.25.
//

import SwiftUI

struct InfoTagView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .cygre(.black, 16)
            .foregroundStyle(.appYellow)
            .padding(.horizontal, 18)
            .padding(.top, 5)
            .padding(.bottom, 9)
            .overlay {
                Capsule()
                    .stroke(.appYellow, lineWidth: 1)
            }
    }
}
