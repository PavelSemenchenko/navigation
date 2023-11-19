//
//  navigationApp.swift
//  navigation
//
//  Created by Pavel Semenchenko on 04.11.2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct navigationApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
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
                            SignInScreen()
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


