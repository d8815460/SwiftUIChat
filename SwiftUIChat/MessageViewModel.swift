//
//  MessageViewModel.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/17.
//

import Foundation

struct MessageViewModel {
    let message: Message
    
    var currentUid: String {
        return AuthViewModel.shared.userSession?.uid ?? ""
    }

    var isFromCurrentUser: Bool {
        return message.fromUserId == currentUid
    }
}
