//
//  Comment.swift
//  SwiftUIChat
//
//  Created by Chupingo on 2023/1/6.
//

import FirebaseFirestoreSwift
import Firebase

struct Comment: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let profileImageUrl: String?
    let postOwnerUid: String
    let commentText: String
    let timestamp: Timestamp
    let uid: String

    var timestampString: String {
        let date = timestamp.dateValue()
        return date.asShortDateString()
    }
}
