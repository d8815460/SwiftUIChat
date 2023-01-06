//
//  NotificationCellViewModel.swift
//  SwiftUIChat
//
//  Created by Chupingo on 2023/1/6.
//

import SwiftUI

class NotificationCellViewModel: ObservableObject {
    @Published var notification: Notification

    init(notification: Notification) {
        self.notification = notification
        checkIfUserIsFollowed()
    }

    func follow() {
        UserService.follow(uid: notification.uid) { _ in
            NotificationsViewModel.uploadNotification(toUid: self.notification.uid, type: .follow)
            self.notification.isFollowed = true
        }
    }

    func unfollow() {
        UserService.unfollow(uid: notification.uid) { _ in
            self.notification.isFollowed = false
        }
    }

    func checkIfUserIsFollowed() {
        guard notification.type == .follow else { return }
        UserService.checkIfUserIsFollowed(uid: notification.uid) { isFollowed in
            self.notification.isFollowed = isFollowed
        }
    }
}
