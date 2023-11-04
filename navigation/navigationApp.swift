//
//  navigationApp.swift
//  navigation
//
//  Created by Pavel Semenchenko on 04.11.2023.
//

import SwiftUI

@main
struct navigationApp: App {
    @ObservedObject var navigationVM = NavigationRouter()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationVM.currentRoute) {
                Splash()
                    .navigationDestination(for: NavigationRoute.self) { route in
                        switch route {
                        case .splash:
                            Splash()
                        case .signIn:
                            SignIn()
                        case .signUp:
                            SignUp()
                        case .home:
                            Home()
                        }
                    }
            }.environmentObject(navigationVM)
        }
    }
}


