//
//  Assembly.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 13.01.26.
//

import Foundation

class Assembly {
    static func createMainViewModel() -> MainViewModel {
        let dataSource = FetchPaymentsManager()
        let repository = FetchPaymentRepositoryImpl(dataSource: dataSource)
        let useCase = FetchPaymentsUseCaseImpl(repository: repository)
        
        let setDataSource = SetPaymentManager()
        let setRepository = SetPaymentRepositoryImpl(dataSource: setDataSource)
        let setUseCase = SetPaymentUseCaseImpl(repository: setRepository)
        return MainViewModel(fetchUseCase: useCase, setUseCase: setUseCase)
    }
    
    static func createAddViewModel() -> AddViewModel {
        let manager = CreatePaymentManager()
        let repository = CreatePaymentRepositoryImpl(dataSource: manager)
        let useCase = CreatePaymentUseCaseImp(repository: repository)
        return AddViewModel(createUseCase: useCase)
    }
    
    static func createPaymentsView() -> PaymentsViewModel {
        let dataSource = FetchPaymentsManager()
        let repository = FetchPaymentRepositoryImpl(dataSource: dataSource)
        let useCase = FetchPaymentsUseCaseImpl(repository: repository)
        return PaymentsViewModel(fetchUseCase: useCase)
    }
}
