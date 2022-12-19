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
                                .foregroundColor(Color(TEXTCOLOR))
                            
                            Text(viewModel.message.text)
                                .font(.system(size: 15))
                                .foregroundColor(Color(TEXTCOLOR))
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
        let viewModel = ConversationCellViewModel(MOCK_MESSAGE)
        ConversationCell(viewModel: viewModel)
    }
}
