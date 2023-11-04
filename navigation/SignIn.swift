//
//  SignIn.swift
//  navigation
//
//  Created by Pavel Semenchenko on 04.11.2023.
//

import SwiftUI

struct SignIn: View {
    @EnvironmentObject private var navigationVM: NavigationRouter
    
    var body: some View {
        VStack {
            Text("Sign In")
            Button("Go Home") {
                navigationVM.pushHome()
            }
        }
    }
}

#Preview {
    SignIn()
}
