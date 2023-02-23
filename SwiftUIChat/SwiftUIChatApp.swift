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
    /*
     在 iOS 14 中，Apple 提供了 ScenePhase 來追蹤應用程序的狀態。 場景的狀態在環境中被追蹤，因此我們創建了 @Environment 屬性來訪問當前值，然後使用 onChange(of:) 修飾符來監聽狀態的任何變化。
     */
    @Environment(\.scenePhase) var scenePhase

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
                .onOpenURL(perform: { url in
                                    print("Incoming url: \(url)")
                                })
        }
        .onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .background:
                print("App State : Background")
            case .inactive:
                print("App State : Inactive")
            case .active:
                print("App State : Active")
            @unknown default:
                print("App State : Unknown")
            }
        }

    }
}
