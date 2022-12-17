//
//  ConversationCellViewModel.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/17.
//

import SwiftUI

class ConversationCellViewModel: ObservableObject {
    @Published var user: User?
    @Published var message: Message

    init(_ message: Message) {
        self.message = message
        fetchUser()
    }

    var toUserId: String {
        return message.fromUserId == AuthViewModel.shared.userSession?.uid ? message.toUserId : message.fromUserId
    }

    var toUserProfileImageUrl: URL? {
        guard let toUserProfileImageUrl = message.user?.profileImageUrl else { return nil }
        return URL(string: toUserProfileImageUrl)
    }

    var fullname: String {
        guard let user = message.user else { return "" }
        return user.fullname
    }

    func fetchUser() {
        COLLECTION_USERS.document(toUserId).getDocument { snapshot, error in
            if let error = error {
                print("DEBUG: Failed to get Auth user with error: \(error.localizedDescription)")
                return
            }
            guard let user = try? snapshot?.data(as: User.self) else { return }
            print("get user data: \(user)")
            self.message.user = user
        }
    }
}
