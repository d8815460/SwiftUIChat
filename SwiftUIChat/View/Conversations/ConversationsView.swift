//
//  ConversationsView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/15.
//

import SwiftUI

struct ConversationsView: View {
    @State private var showNewMessageView = false
    @State private var showChatView = false
    @State var selectedUser: User?
    @ObservedObject var viewModel = ConversationsViewModel()

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            if let user = selectedUser {
                NavigationLink(
                    destination: ChatView(user: user),
                    isActive: $showChatView,
                    label: { }
                )
            }
            
            // chats
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.recentMessages) { message in
                        NavigationLink(
                            destination: ChatView(user: MOCK_USER),
                            label: { ConversationCell(viewModel: ConversationCellViewModel(message)) }
                        )
                    }
                }
            }
            
            //floating button
            
            Button(action: {
                showNewMessageView.toggle()
            }, label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding()
            })
            .background(Color.theme.mainColor)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $showNewMessageView, content: {
                NewMessageView(showChatView: $showChatView, user: $selectedUser)
            })
        }
        .onAppear {
            viewModel.fetchRecentMessages()
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
