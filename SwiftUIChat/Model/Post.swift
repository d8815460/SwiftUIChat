//
//  Post.swift
//  SwiftUIChat
//
//  Created by Chupingo on 2023/1/6.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    let ownerImageUrl: String?

    var didLike: Bool? = false
}
