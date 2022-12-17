//
//  MessageView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/16.
//

import SwiftUI
import Firebase

struct MessageView: View {
    let viewModel: MessageViewModel

    var body: some View {
        HStack {
            if viewModel.isFromCurrentUser {
                // 前面填空
                Spacer()
                // 自己發言
                Text(viewModel.message.text)
                    .padding(12)
                    .background(Color.blue)
                    .font(.system(size: 15))
                    .clipShape(ChatBubble(isFromCUrrentUser: true))
                    .foregroundColor(.white)
                    .padding(.leading, 100)
                    .padding(.horizontal)

            } else {

                HStack(alignment: .bottom) {
                    // 用戶大頭照
                    Image("venom-7")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                    // 對方發言
                    Text(viewModel.message.text)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .font(.system(size: 15))
                        .clipShape(ChatBubble(isFromCUrrentUser: false))
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                .padding(.trailing, 80)

                Spacer() //後面填空

            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MessageViewModel(message: Message(fromUserId: "aaa", toUserId: "bbb", isReaded: false, text: "test", createdAt: Timestamp(date: Date()), updatedAt: Timestamp(date: Date())))
        MessageView(viewModel: viewModel)
    }
}
