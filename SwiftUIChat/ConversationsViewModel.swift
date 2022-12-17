//
//  ConversationsViewModel.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/17.
//

import SwiftUI

class ConversationsViewModel: ObservableObject {
    @Published var recentMessages = [Message]()

    init() {
        fetchRecentMessages()
    }

    func fetchRecentMessages() {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        let query = COLLECTION_MESSAGES.document(currentUid)
            .collection(MESSAGES_REFCENT_MESSAGES)
            .order(by: MESSAGES_CREATEDAT, descending: true)

        query.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            self.recentMessages = documents.compactMap{ try? $0.data(as: Message.self) }
        }
    }
}
