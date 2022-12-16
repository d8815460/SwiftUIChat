//
//  ChatViewModel.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/16.
//

import Foundation

class ChatViewModel: ObservableObject {

    @Published var messages = [Message]()

    init() {
        messages = mockMessages
    }

    var mockMessages: [Message] {
        [
            .init(isFromCurrentUser: true, messageText: "Hey what's up man"),
            .init(isFromCurrentUser: false, messageText: "Not much how are you"),
            .init(isFromCurrentUser: true, messageText: "I'm doning fine. Have fun building this app"),
            .init(isFromCurrentUser: true, messageText: "Are you learning alot?"),
            .init(isFromCurrentUser: false, messageText: "Yeah i am i love this course"),
            .init(isFromCurrentUser: true, messageText: "That's awesome, im glad i bought it"),
            .init(isFromCurrentUser: true, messageText: "Talk to you later!")
        ]
    }
}
