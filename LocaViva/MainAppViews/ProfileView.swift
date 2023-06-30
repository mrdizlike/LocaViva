//
//  ProfileView.swift
//  LocaViva
//
//  Created by Виктор on 30.06.2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewMode
    
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    Text(user.firstName)
                    Button {
                        viewModel.signOut()
                    } label: {
                        Text("signOut")
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
