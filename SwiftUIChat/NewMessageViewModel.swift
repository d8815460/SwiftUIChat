//
//  NewMessageViewModel.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/17.
//

import Firebase

class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()

    init() {
        fetchUsers()
    }

    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, error in
            if let error = error {
                print("DEBUG: Failed to fetch users with error: \(error.localizedDescription)")
                return
            }

            guard let documents = snapshot?.documents else { return }

//            documents.forEach { document in
//                guard let user = try? document.data(as: User.self) else { return }
//                self.users.append(user)
//            }

            self.users = documents.compactMap({ try? $0.data(as: User.self) })
            print("DEBUG: Users: \(self.users)")
        }
    }
}
