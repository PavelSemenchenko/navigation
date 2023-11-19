//
//  UserProfileView.swift
//  navigation
//
//  Created by Pavel Semenchenko on 19.11.2023.
//

import SwiftUI

struct UserProfileView: View {
  var userProfile: UserProfile
  var body: some View {
    NavigationView {
      Form {
        Text(userProfile.uid)
        Text(userProfile.firstName)
        Text(userProfile.lastName)
        Text(userProfile.city)
      }
      .navigationBarTitle("User \(userProfile.uid)")
    }
  }
}

