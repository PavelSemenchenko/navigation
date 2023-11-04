//
//  Home.swift
//  navigation
//
//  Created by Pavel Semenchenko on 04.11.2023.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var navigationVM: NavigationRouter
    
    var body: some View {
        VStack {
            Text("Home")
            Button("Sign In") {
                // what to do
                navigationVM.pushScreen(route: .signIn)
            }
        }
    }
}

#Preview {
    Home()
}
