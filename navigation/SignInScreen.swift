//
//  SignIn.swift
//  navigation
//
//  Created by Pavel Semenchenko on 04.11.2023.
//

import SwiftUI

struct SignInScreen: View {
    @EnvironmentObject private var navigationVM: NavigationRouter
    @ObservedObject var vm = SignInVM()
    
    fileprivate func EmailInput() -> some View {
        TextField("Email", text: $vm.email)
            .keyboardType(.emailAddress)
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .textFieldStyle(.roundedBorder)
    }
    
    fileprivate func PasswordInput() -> some View {
        SecureField("Password", text: $vm.password)
            .textFieldStyle(.roundedBorder)
    }
    
    fileprivate func LoginButton() -> some View {
        Button(action: {
            Task {
                await vm.signIn()
            }
        }) {
            Text("Sign In")
        }
    }
    fileprivate func LogoutButton() -> some View {
        Button(action: {
            Task {
                await vm.signOut()
            }
        }) {
            Text("Log Out")
        }
    }
    
    fileprivate func UserInfo() -> some View {
        VStack{
            Text("UID: \(vm.currentUser.uid)")
            Text("Email: \(vm.currentUser.email)")
            LogoutButton()
        }
    }
    fileprivate func SignUp() -> some View {
        Button(action: {
            navigationVM.pushScreen(route: .signUp)
        }, label: {
            Text("Sign Up")
        })
    }
    var body: some View {
        VStack {
            if(vm.isLoggedIn){
                UserInfo()
            }else{
                EmailInput()
                PasswordInput()
                LoginButton().padding(40)
                SignUp()
            }
        }
        .alert("Error", isPresented: $vm.hasError) {
        } message: {
            Text(vm.errorMessage)
        }
        .padding()
        
        Button("Go Home") {
            navigationVM.pushHome()
        }
    }
}
    

#Preview {
    SignInScreen().environmentObject(SignInVM())
}
