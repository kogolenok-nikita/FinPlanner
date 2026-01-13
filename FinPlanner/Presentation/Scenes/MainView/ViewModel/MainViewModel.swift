//
//  MainViewModel.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 13.01.26.
//

import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    private let createUseCase: CreatePaymentUseCase
    
    init(createUseCase: CreatePaymentUseCase) {
        self.createUseCase = createUseCase
    }
}
