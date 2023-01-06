//
//  SearchViewModel.swift
//  SwiftUIChat
//
//  Created by Chupingo on 2023/1/6.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var posts = [Post]()
    
    init() {
        fetchUsers()
        fetchPosts()
    }

    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
        }
    }

    func fetchPosts() {
        COLLECTION_POSTS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }

    func filteredUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.contains(lowercasedQuery) })
    }
}
