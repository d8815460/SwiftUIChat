//
//  SettingsView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/15.
//

import SwiftUI
import FirebaseAuth

struct SettingsView: View {

    private let user: User

    init(user: User) {
        self.user = user
    }

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {

                ScrollView {
                    NavigationLink(
                        destination: EditProfileView(),
                        label: { SettingsHeaderView(user: user) })

                    VStack(spacing: 1) {
                        ForEach(SettingsCellViewModel.allCases, id: \.self) { viewModel in
                            SettingsCell(viewModel: viewModel)
                        }
                    }

                    Button(action: {
                        AuthViewModel.shared.signout()
                    }, label: {
                        Text("Log Out")
                            .foregroundColor(.red)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: UIScreen.main.bounds.width, height: 50)
                            .background(Color(WHITECOLOR))
                    })

                    Spacer()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let user = MOCK_USER
        SettingsView(user: user)
    }
}

