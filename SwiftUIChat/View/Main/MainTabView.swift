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
            TabView(selection: $selectedIndex) {
                NavigationView {
                    ConversationsView()
                        .navigationTitle(tabTitle)
                }
                .tabItem { Image(systemName: "bubble.left") }
                .tag(0)

                NavigationView {
                    FeedView()
                        .navigationTitle(tabTitle)
                }
                .tabItem { Image(systemName: "house") }
                .tag(1)

                NavigationView {
                    ChannelsView()
                        .navigationTitle(tabTitle)
//                    UploadPostView()
//                        .navigationTitle(tabTitle)
                }
                .tabItem { Image(systemName: "bitcoinsign") }
                .tag(2)

                NavigationView {
                    NotificationView()
                        .navigationTitle(tabTitle)
                }
                .tabItem { Image(systemName: "bitcoinsign") }
                .tag(3)

                NavigationView {
                    SettingsView(user: user)
                        .navigationTitle(tabTitle)
                }
                .tabItem { Image(systemName: "gear") }
                .tag(4)
            }
            .accentColor(Color.theme.mainColor)
        } else {
            // show failed to load or empty state view
        }
    }

    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Chats"
        case 1: return "Feed"
        case 2: return "Post"
        case 3: return "Notification"
        case 4: return "Settings"
        default: return ""
        }
    }
}

// Preview missing environment of type: AuthViewModel. To resolve this add .environmentObject(AuthViewModel(...)) to the appropriate preview.
//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
//}
