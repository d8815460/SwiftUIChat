//
//  ChatViewModel.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/16.
//

import Firebase

class ChatViewModel: ObservableObject {

    @Published var messages = [Message]()

    let user: User

    init(user: User) {
        self.user = user
        fetchMessages()
    }

    func fetchMessages() {
        guard
            let currentUid = AuthViewModel.shared.userSession?.uid,
            let toUserId = user.id
        else { return }

        let query = COLLECTION_MESSAGES
            .document(currentUid)
            .collection(toUserId)
            .order(by: MESSAGES_CREATEDAT, descending: false)

        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            var messages = changes.compactMap{ try? $0.document.data(as: Message.self) }

            for (index, message) in messages.enumerated() where message.fromUserId != currentUid {
                messages[index].user = self.user
            }

            self.messages.append(contentsOf: messages)
        }

        query.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            var messages = documents.compactMap{ try? $0.data(as: Message.self) }

            for (index, message) in messages.enumerated() where message.fromUserId != currentUid {
                messages[index].user = self.user
            }

            self.messages = messages
        }
    }

    func sendMessage(_ messageText: String) {
        guard
            let currentUid = AuthViewModel.shared.userSession?.uid,
            let toUserId = user.id
        else { return }

        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(toUserId).document()

        let toUserRef = COLLECTION_MESSAGES.document(toUserId).collection(currentUid)

        let messageId = currentUserRef.documentID

        let data: [String: Any] = [MESSAGES_TEXT: messageText,
                               MESSAGES_FROMUSER: currentUid,
                                 MESSAGES_TOUSER: toUserId,
                               MESSAGES_ISREADED: false,
                              MESSAGES_CREATEDAT: Timestamp(date: Date()),
                              MESSAGES_UPDATEDAT: Timestamp(date: Date())
        ]
        currentUserRef.setData(data)
        toUserRef.document(messageId).setData(data)
    }
}
