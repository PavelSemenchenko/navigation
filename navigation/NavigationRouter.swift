//
//  NavigationRouter.swift
//  navigation
//
//  Created by Pavel Semenchenko on 04.11.2023.
//

import Foundation
import SwiftUI

enum NavigationRoute: Hashable {
    case splash
    case signUp
    case signIn
    case home
    //case editTodo(todo: Todo )
}

class NavigationRouter: ObservableObject {
    @Published var currentRoute: NavigationPath = NavigationPath()
    
    func pushScreen(route: NavigationRoute) {
        currentRoute.append(route)
    }
    func pushHome() {
        currentRoute.removeLast(currentRoute.count)
        pushScreen(route: .home)
    }
    func popScreen() {
        currentRoute.removeLast()
    }
    func popUntilSignInScreen() {
        currentRoute.removeLast(currentRoute.count)
        pushScreen(route: .signIn)
    }
}
