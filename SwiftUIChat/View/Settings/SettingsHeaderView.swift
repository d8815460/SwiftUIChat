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
            KFImage(URL(string: user.profileImageUrl ?? "venom-7"))
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding(.leading)

            VStack(alignment: .leading, spacing: 4) {
                Text(user.fullname)
                    .font(.system(size: 18))
                    .foregroundColor(.black)

                Text("Available")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }

            Spacer()
        }
        .frame(height: 90)
        .background(Color.white)
    }
}
