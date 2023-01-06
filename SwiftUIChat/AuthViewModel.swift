//
//  AuthViewModel.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/16.
//

import Firebase
import UIKit

class AuthViewModel: NSObject, ObservableObject {

    @Published var didAuthenticateUser = false
    @Published var didUploadPhoto = false
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    static let shared = AuthViewModel()

    override init() {
        super.init()
        userSession = Auth.auth().currentUser
        fetchUser()
    }

    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error: \(error.localizedDescription)")
                return
            }

            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }

    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error: \(error.localizedDescription)")
                return
            }

            guard let user = result?.user else { return }

            let data: [String: Any] = ["email": email,
                                       "username": username,
                                       "fullname": fullname]

            print("DEBUG: Succesfully register user in firestore..")
            COLLECTION_USERS.document(user.uid).setData(data) { _ in
                print("DEBUG: Succesfully updated user info in firestore..")
                self.didAuthenticateUser = true
            }
        }
    }

    func uploadProfileImage(_ image: UIImage) {
        print("DEBUG: upload profile image from view model")
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
            guard
                let currentUser = Auth.auth().currentUser
            else { return }
            print("DEBUG: upload profile image to firestore")
            let changeRequest = currentUser.createProfileChangeRequest()
            changeRequest.photoURL = URL(string: imageUrl)
            changeRequest.commitChanges { error in
                if let error = error {
                    print("DEBUG: Failed to upload photoURL on Auth user with error: \(error.localizedDescription)")
                    return
                }
                print("DEBUG: Succesfully updated photoURL..")
                COLLECTION_USERS.document(currentUser.uid).updateData(["profileImageUrl": imageUrl]) { error in
                    if let error = error {
                        print("DEBUG: Failed to upload profileImageUrl with error: \(error.localizedDescription)")
                        return
                    }
                    print("DEBUG: Succesfully updated user profileImageUrl...")
                    self.didUploadPhoto = true
                }
            }
        }
    }

    func signout() {
        self.userSession = nil
        self.currentUser = nil
        try? Auth.auth().signOut()
    }

    func fetchUser() {
        guard let uid = userSession?.uid else { return }

        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            if let error = error {
                print("DEBUG: Failed to get Auth user with error: \(error.localizedDescription)")
                return
            }
            guard let user = try? snapshot?.data(as: User.self) else { return }
            print("get user data: \(user)")
            self.currentUser = user
        }
    }
}
