//
//  FeedCellViewModel.swift
//  SwiftUIChat
//
//  Created by Chupingo on 2023/1/6.
//

import SwiftUI
import Kingfisher

class FeedCellViewModel: ObservableObject {
    @Published var post: Post

    var likeString: String {
//        let label = post.likes == 1 ? "like" : "likes"
        return "\(post.likes)"
    }

    init(post: Post) {
        self.post = post
        checkIfUserLikedPost()
    }

    func like() {
        guard let uid = AuthViewModel.shared.currentUser?.id else { return }
        guard let postId = post.id else { return }

        COLLECTION_POSTS.document(post.id ?? "").collection("post-likes").document(uid).setData([:]) { _ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).setData([:]) { _ in

                COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes + 1])

//                NotificationViewModel.uploadNotification(toUid: self.post.ownerUid, type: .like, post: self.post)

                self.post.didLike = true
                self.post.likes += 1
            }
        }
    }

    func unlike() {
        guard let uid = AuthViewModel.shared.currentUser?.id else { return }
        guard let postId = post.id else { return }

        COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).delete { _ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).delete { _ in
                COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes - 1])
                
                self.post.didLike = false
                self.post.likes -= 1
            }
        }
    }

    func checkIfUserLikedPost() {
        guard let uid = AuthViewModel.shared.currentUser?.id else { return }
        guard let postId = post.id else { return }

        COLLECTION_USERS.document(uid).collection("user-likes").document(postId).getDocument { snapshot, _ in
            guard let didLike = snapshot?.exists else { return }
            self.post.didLike = didLike
        }
    }
}
