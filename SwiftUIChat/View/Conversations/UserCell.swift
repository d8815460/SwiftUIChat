//
//  UserCell.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/16.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User

    var body: some View {
        VStack {
            HStack {
                if let photoURL = user.profileImageUrl {
                    KFImage(URL(string: photoURL))
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
                        .padding(.leading)
                }
                
                // message info
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.username)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(user.fullname)
                        .font(.system(size: 15))
                }
                .foregroundColor(.black)
                
                Spacer()
                
            }
            .padding(.horizontal)
            }
        .padding(.top)
    }
}
