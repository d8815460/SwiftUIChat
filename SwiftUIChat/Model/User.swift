//
//  User.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/17.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String?
}
