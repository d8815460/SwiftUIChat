//
//  ChatBubble.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/16.
//

import SwiftUI

struct ChatBubble: Shape {
    var isFromCUrrentUser: Bool

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, isFromCUrrentUser ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        return Path(path.cgPath)
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(isFromCUrrentUser: true)
    }
}
