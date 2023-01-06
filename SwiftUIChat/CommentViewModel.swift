//
//  CommentViewModel.swift
//  SwiftUIChat
//
//  Created by Chupingo on 2023/1/6.
//

import SwiftUI
import Firebase

class CommentViewModel: ObservableObject {

    private let post: Post
    @Published var comments = [Comment]()

    init(post: Post) {
        self.post = post
    }

    func uploadComment(commentText: String) {
        guard
            let user = AuthViewModel.shared.currentUser,
            let postId = post.id
        else { return }

        let data = ["username": user.username,
                    "profileImageUrl": user.profileImageUrl ?? "",
                    "uid": user.id ?? "",
                    "timestamp": Timestamp(date: Date()),
                    "postOwnerUid": post.ownerUid,
                    "commentText": commentText] as [String : Any]

        COLLECTION_POSTS.document(postId).collection("post-comments").addDocument(data: data) { error in
            if let error = error {
                print("DEBUG: Error uploading comment \(error.localizedDescription)")
                return
            }

//            NotificationViewModel.uploadNotification(toUid: self.post.ownerUid, type: .comment, post: self.post)

        }
    }

    func fetchComments() {
        guard let postId = post.id else { return }
        let query = COLLECTION_POSTS.document(postId).collection("post-comments").order(by: "timestamp", descending: true)

        query.addSnapshotListener { snapshot, _ in
            guard let addedDocs = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            self.comments = addedDocs.compactMap({ try? $0.document.data(as: Comment.self) })
        }
    }
}
