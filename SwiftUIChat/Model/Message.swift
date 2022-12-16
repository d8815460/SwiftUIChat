//
//  Message.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/16.
//

import Foundation

struct Message: Identifiable {
    let id = NSUUID().uuidString
    let isFromCurrentUser: Bool
    let messageText: String
}
