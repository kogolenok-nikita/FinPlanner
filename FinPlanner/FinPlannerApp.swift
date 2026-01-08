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
                        case .details:
                            DetailsView(path: $path)
                        }
                    }
            }
        }
    }
}
