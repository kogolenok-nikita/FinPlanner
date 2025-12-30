//
//  View.ext.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 29.12.25.
//

import SwiftUI

extension View {
    func cygre(_ font: Cygre = .regular, _ size: CGFloat = 14) -> some View {
        self
            .font(.custom(font.rawValue, size: size))
    }
}
