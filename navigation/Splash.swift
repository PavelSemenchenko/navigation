//
//  Splash.swift
//  navigation
//
//  Created by Pavel Semenchenko on 04.11.2023.
//

import SwiftUI

struct Splash: View {
    @EnvironmentObject private var navigationVM: NavigationRouter
    
    var body: some View {
        Text("Splash")
            .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                navigationVM.pushScreen(route: .home)
            }
        }
    }
}

#Preview {
    Splash()
}
