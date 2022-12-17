//
//  ChatView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/15.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @ObservedObject var viewModel: ChatViewModel

    private let user: User

    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }

    var body: some View {
        VStack {
            // messages
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        MessageView(viewModel: MessageViewModel(message: message))
                    }
                }
            }

            // input view
            CustomInputView(text: $messageText, action: sendMessage)
        }
        .navigationTitle(user.fullname)
        .navigationBarTitleDisplayMode(.inline)

    }

    func sendMessage() {
        print("Send message \(messageText)")
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        let user = MOCK_USER
        ChatView(user: user)
    }
}
