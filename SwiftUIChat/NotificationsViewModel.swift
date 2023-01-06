//
//  NotificationViewModel.swift
//  SwiftUIChat
//
//  Created by Chupingo on 2023/1/6.
//

import SwiftUI
import Firebase

class NotificationsViewModel: ObservableObject {
    @Published var notifications = [Notification]()

    func fetchNotification() {
        
    }

    static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let user = AuthViewModel.shared.currentUser, let uid = user.id else { return }

        var data: [String: Any] = ["timestamp": Timestamp(date: Date()),
                                   "username": user.username,
                                   "uid":user.id ?? "",
                                   "profileImageUrl": user.profileImageUrl ?? "",
                                   "type": type.rawValue]

        if let post = post, let id = post.id {
            data["postId"] = id
        }

        COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data)
    }
}
