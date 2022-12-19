//
//  SettingsCellViewModel.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/16.
//
import SwiftUI

enum SettingsCellViewModel: Int, CaseIterable {
    case account
    case notifications
    case starredMessages
    case account1
    case account2
    case account3
    case account4
    case account5
    case account6
    case account7
    case account8

    var title: String {
        switch self {
        case .account, .account1, .account2, .account3, .account4, .account5, .account6, .account7, .account8: return "Account"
        case .notifications: return "Notifications"
        case .starredMessages: return "Starred Messages"
        }
    }

    var imageName: String {
        switch self {
        case .account, .account1, .account2, .account3, .account4, .account5, .account6, .account7, .account8: return "key.fill"
        case .notifications: return "bell.badge.fill"
        case .starredMessages: return "star.fill"
        }
    }

    var backgroundColor: Color {
        switch self {
        case .account, .account1, .account2, .account3, .account4, .account5, .account6, .account7, .account8: return .blue
        case .notifications: return .red
        case .starredMessages: return .yellow
        }
    }
}
