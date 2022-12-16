//
//  ConversationCell.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/16.
//

import SwiftUI

struct ConversationCell: View {
//    @ObservedObject var viewModel: ConversationCellViewModel
    
    var body: some View {
//        if let user = viewModel.message.user {
            NavigationLink(destination: ChatView()) {
                VStack {
                    HStack {
                        
                        Image("venom-7")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                        
                        // message info
                        VStack(alignment: .leading, spacing: 4) {
                            Text("viewModel.fullname")
                                .font(.system(size: 14, weight: .semibold))
                            
                            Text("viewModel.message.text")
                                .font(.system(size: 15))
                        }.foregroundColor(.black)
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal)
                    
                    Divider()
                }
                .padding(.top)
            }
//        }
    }
}
