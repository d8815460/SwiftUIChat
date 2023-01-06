//
//  FeedViewModel.swift
//  SwiftUIChat
//
//  Created by Chupingo on 2023/1/6.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()

    init() {
        fetchPosts()
    }

    func fetchPosts() {
        COLLECTION_POSTS.getDocuments { snapshot, error in
            if let error = error {
                print("DEBUG: Failed to fetch users with error: \(error.localizedDescription)")
                return
            }
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
}
