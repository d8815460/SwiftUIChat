//
//  SettingsHeaderView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/15.
//

import SwiftUI
import Kingfisher

struct SettingsHeaderView: View {

    private let user: User

    init(user: User) {
        self.user = user
    }

    var body: some View {
        HStack {
            if let photoURL = user.profileImageUrl {
                KFImage(URL(string: photoURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.leading)
            } else {
                Image("venom-7")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.leading)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(user.fullname)
                    .font(.system(size: 18))
                    .foregroundColor(Color(TEXTCOLOR))

                Text("Available")
                    .foregroundColor(Color(TEXTGRAYCOLOR))
                    .font(.system(size: 14))
            }

            Spacer()
        }
        .frame(height: 90)
        .background(Color(WHITECOLOR))
    }
}

struct SettingsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let user = MOCK_USER
        SettingsHeaderView(user: user)
    }
}
