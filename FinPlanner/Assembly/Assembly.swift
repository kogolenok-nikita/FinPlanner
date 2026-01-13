//
//  Assembly.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 13.01.26.
//

import Foundation

class Assembly {
    static func createMainViewModel() {
        
    }
    
    static func createAddViewModel() -> AddViewModel {
        let manager = CreatePaymentManager()
        let repository = CreatePaymentRepositoryImpl(dataSource: manager)
        let useCase = CreatePaymentUseCaseImp(repository: repository)
        return AddViewModel(createUseCase: useCase)
    }
}
