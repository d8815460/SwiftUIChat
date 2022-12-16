//
//  SwiftUIChatApp.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/15.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct SwiftUIChatApp: App {

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            if let user = Auth.auth().currentUser {
                // TODO: 如果沒有上傳照片，跳轉到 ProfilePhotoSelectorView
                if user.photoURL != nil {
                    MainTabView()
                } else {
                    ProfilePhotoSelectorView()
                }
            } else {
                LoginView(viewModel: AuthViewModel())
            }
        }
    }
}
