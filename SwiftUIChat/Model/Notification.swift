//
//  Notification.swift
//  SwiftUIChat
//
//  Created by Chupingo on 2023/1/6.
//

import FirebaseFirestoreSwift
import Firebase

struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: NotificationType
    let uid: String

    var isFollowed: Bool? = false
}

enum NotificationType: Int, Decodable {
    case like
    case comment
    case follow

    var notificationMessage: String {
        switch self {
        case .like: return " liked one of your posts."
        case .comment: return " commented on ome of your posts."
        case .follow: return " started following you."
        }
    }
}
