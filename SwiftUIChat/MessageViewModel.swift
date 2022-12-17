//
//  MessageViewModel.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/17.
//

import Foundation

struct MessageViewModel {
    let message: Message

    init(_ message: Message) {
        self.message = message
    }

    var currentUid: String {
        return AuthViewModel.shared.userSession?.uid ?? ""
    }

    var isFromCurrentUser: Bool {
        return message.fromUserId == currentUid
    }

    var profileImageUrl: URL? {
        guard let profileImageUrl = message.user?.profileImageUrl else { return nil }
        return URL(string: profileImageUrl)
    }
}
