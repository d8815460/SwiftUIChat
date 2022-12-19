//
//  MessageView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/16.
//

import SwiftUI
import Firebase
import Kingfisher

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
                    .foregroundColor(Color.theme.whiteColor)
                    .padding(.leading, 100)
                    .padding(.horizontal)

            } else {

                HStack(alignment: .bottom) {
                    // 用戶大頭照
                    if let photoURL = viewModel.profileImageUrl{
                        KFImage(photoURL)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                    } else {
                        Image("venom-7")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                            .padding(.leading)
                    }
                    // 對方發言
                    Text(viewModel.message.text)
                        .padding(12)
                        .background(Color.theme.itemBackgroundColor)
                        .font(.system(size: 15))
                        .clipShape(ChatBubble(isFromCUrrentUser: false))
                        .foregroundColor(Color.theme.primaryTextColor)
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
        let viewModel = MessageViewModel(MOCK_MESSAGE)
        MessageView(viewModel: viewModel)
    }
}
