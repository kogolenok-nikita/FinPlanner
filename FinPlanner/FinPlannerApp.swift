//
//  FinPlannerApp.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 29.12.25.
//

import SwiftUI

@main
struct FinPlannerApp: App {
    @State var path: NavigationPath = .init()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                MainTabView(path: $path) 
                    .navigationDestination(for: NavigationPage.self) { page in
                        switch page {
                        case .details(let payment):
                            DetailsView(path: $path, viewModel: Assembly.createDetailsViewModel(payment: payment))
                        }
                    }
            }
            .onAppear {
                print(FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first)
            }
        }
    }
}
