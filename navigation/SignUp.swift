//
//  SignUp.swift
//  navigation
//
//  Created by Pavel Semenchenko on 04.11.2023.
//

import SwiftUI

struct SignUp: View {
  @State var firstName: String = ""
  @State var lastName: String = ""
  @State var city: String = ""
  @State var email: String = ""
  @State var password: String = ""
  @State var confirmPassword: String = ""

  @State var showSignUpForm = true
  @State var showDetails = false

  @ObservedObject var sessionStore = SessionStore()
  @State var profile: UserProfile?

  var body: some View {
    NavigationView {
      VStack {
        if self.showSignUpForm {
          Form {
            Section {
              TextField("First name", text: $firstName)
                .textContentType(.givenName)
              TextField("Last name", text: $lastName)
                .textContentType(.familyName)
              TextField("City", text: $city)
                .textContentType(.addressCity)
            }
            Section {
              TextField("Email", text: $email)
                .textContentType(.emailAddress)
                .autocapitalization(.none)
              SecureField("Password", text: $password)
              SecureField("Confirm password", text: $confirmPassword)
            }
            Button(action: { self.signUp() }) {
              Text("Sign up")
            }
          }
          .navigationBarTitle("Sign up")
        }
        else {
          Form {
            TextField("Email", text: $email)
              .textContentType(.emailAddress)
              .autocapitalization(.none)
            SecureField("Password", text: $password)
            Button(action: { self.signIn() }) {
              Text("Sign in")
            }
          }
          .navigationBarTitle("Sign in")
        }
        Button(action: { self.showSignUpForm.toggle() }) {
          Text(self.showSignUpForm ? "Have an account? Sign in instead." : "No account yet? Click here to sign up instead.")
        }
      }
      .sheet(isPresented: $showDetails) {
        UserProfileView(userProfile: self.profile ??  UserProfile(uid: "", firstName: "", lastName: "", city: ""))
      }
    }
  }

  func signUp() {
    sessionStore.signUp(email: self.email, password: self.password, firstName: self.firstName, lastName: self.lastName, city: self.city) { (profile, error) in
      if let error = error {
        print("Error when signing up: \(error)")
        return
      }
      self.profile = profile
      self.showDetails.toggle()
    }
  }

  func signIn() {
    sessionStore.signIn(email: self.email, password: self.password) { (profile, error) in
      if let error = error {
        print("Error when signing up: \(error)")
        return
      }
      self.profile = profile
      self.showDetails.toggle()
    }
  }
}

#Preview {
    SignUp()
}
