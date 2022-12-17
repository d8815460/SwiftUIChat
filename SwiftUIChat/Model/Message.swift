//
//  Message.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/16.
//

import FirebaseFirestoreSwift
import Firebase

struct Message: Identifiable, Decodable {
    @DocumentID var id: String?
    let fromUserId: String
    let toUserId: String
    let isReaded: Bool
    let text: String
    let createdAt: Timestamp
    let updatedAt: Timestamp

    var user: User?
}
