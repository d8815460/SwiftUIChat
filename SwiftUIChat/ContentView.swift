//
//  ContentView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/15.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        if viewModel.userSession != nil  {
            // TODO: 如果沒有上傳照片，跳轉到 ProfilePhotoSelectorView
            if viewModel.userSession?.photoURL != nil {
                MainTabView()
            } else {
                ProfilePhotoSelectorView()
            }
        } else {
            LoginView()
        }
    }
}

// Preview missing environment of type: AuthViewModel. To resolve this add .environmentObject(AuthViewModel(...)) to the appropriate preview.
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
