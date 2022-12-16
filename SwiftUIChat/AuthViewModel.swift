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

    func login() {
        
    }

    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error: \(error.localizedDescription)")
                return
            }

            guard
                let user = result?.user
            else { return }

            let data: [String: Any] = ["email": email,
                                       "username": username,
                                       "fullname": fullname]

            print("DEBUG: Succesfully register user in firestore..")
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = fullname
            changeRequest.commitChanges { error in
                if let error = error {
                    print("DEBUG: Failed to upload fullname on Auth user with error: \(error.localizedDescription)")
                    return
                }
                Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                    print("DEBUG: Succesfully updated user info in firestore..")
                    self.didAuthenticateUser = true
                }
            }
        }
    }

    func uploadProfileImage(_ image: UIImage) {
        print("DEBUG: upload profile image from view model")
        ImageUploader.uploadImage(image: image) { imageUrl in
            guard
                let user = Auth.auth().currentUser
            else { return }
            print("DEBUG: upload profile image to firestore")
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.photoURL = URL(string: imageUrl)
            changeRequest.commitChanges { error in
                if let error = error {
                    print("DEBUG: Failed to upload photoURL on Auth user with error: \(error.localizedDescription)")
                    return
                }
                print("DEBUG: Succesfully updated photoURL..")
                Firestore.firestore().collection("users").document(user.uid).updateData(["profileImageUrl": imageUrl]) { _ in
                    print("DEBUG: Succesfully updated user data...")
                    self.didUploadPhoto = true
                }
            }
        }
    }

    func signout() {
        
    }

}
