//
//  Constants.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/17.
//

import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_MESSAGES = Firestore.firestore().collection("messages")

let MOCK_USER = User(id: "apdo9ifjqpowijefpoiawj", username: "Test", fullname: "Test", email: "test@gmail.com", profileImageUrl: nil)


// Message Class
let MESSAGES_REFCENT_MESSAGES = "recent-messages"
// Field
let MESSAGES_TEXT = "text"
let MESSAGES_FROMUSER = "fromUserId"
let MESSAGES_TOUSER = "toUserId"
let MESSAGES_ISREADED = "isReaded"
let MESSAGES_CREATEDAT = "createdAt"
let MESSAGES_UPDATEDAT = "updatedAt"
