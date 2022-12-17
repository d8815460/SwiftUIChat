//
//  Constants.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/17.
//

import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let MOCK_USER = User(id: "apdo9ifjqpowijefpoiawj", username: "Test", fullname: "Test", email: "test@gmail.com", profileImageUrl: "www.google.com")
