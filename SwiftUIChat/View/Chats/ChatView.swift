//
//  ChatView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/15.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @ObservedObject var viewModel = ChatViewModel()

    var body: some View {
        VStack {
            // messages
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        MessageView(isFromCurrentUser: message.isFromCurrentUser, messageText: message.messageText)
                    }
                }
            }

            // input view
            CustomInputView(text: $messageText, action: sendMessage)
        }
        .navigationTitle("venom")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)

    }

    func sendMessage() {
        print("Send message \(messageText)")
        messageText = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
