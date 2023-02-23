//
//  MainTabView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/15.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        if let user = viewModel.currentUser {
            NavigationView {
                TabView(selection: $selectedIndex) {
                    FeedView()
                    .tabItem {
                        VStack {
                            Image(systemName: "house").imageScale(.large)
                            Text("Feed")
                        }
                    }
                    .tag(0)

                    ConversationsView()
                    .tabItem {
                        VStack {
                            Image(systemName: "bubble.left").imageScale(.large)
                            Text("Chats")
                        }
                    }
                    .tag(1)

                    UploadPostView()
                    .tabItem {
                        VStack {
                            Image(systemName: "plus.circle.fill").imageScale(.large)
                            Text("Post")
                        }
                    }
                    .tag(2)

                    SettingsView(user: user)
                    .tabItem {
                        VStack {
                            Image(systemName: "gear").imageScale(.large)
                            Text("Settings")
                        }
                    }
                    .tag(3)
                }
                .accentColor(Color.theme.mainColor)
            }
        } else {
            // show failed to load or empty state view
        }
    }
}

// Preview missing environment of type: AuthViewModel. To resolve this add .environmentObject(AuthViewModel(...)) to the appropriate preview.
//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
//}
