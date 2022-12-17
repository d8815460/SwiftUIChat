//
//  ConversationCell.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/16.
//

import SwiftUI
import Kingfisher
import Firebase

struct ConversationCell: View {
    @ObservedObject var viewModel: ConversationCellViewModel

    var body: some View {
        if let user = viewModel.message.user {
            NavigationLink(destination: ChatView(user: user)) {
                VStack {
                    HStack {
                        if let url = viewModel.toUserProfileImageUrl {
                            KFImage(url)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 48, height: 48)
                                .clipShape(Circle())
                        } else {
                            Image("venom-7")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 48, height: 48)
                                .clipShape(Circle())
                        }
                        
                        // message info
                        VStack(alignment: .leading, spacing: 4) {
                            Text(viewModel.fullname)
                                .font(.system(size: 14, weight: .semibold))
                            
                            Text(viewModel.message.text)
                                .font(.system(size: 15))
                        }.foregroundColor(.black)
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal)
                    
                    Divider()
                }
                .padding(.top)
                .onAppear {
                    viewModel.fetchUser()
                }
            }
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        let message = Message(fromUserId: "aa", toUserId: "bbb", isReaded: false, text: "ccc", createdAt: Timestamp(date: Date()), updatedAt: Timestamp(date: Date()))
        let viewModel = ConversationCellViewModel(message)
        ConversationCell(viewModel: viewModel)
    }
}
