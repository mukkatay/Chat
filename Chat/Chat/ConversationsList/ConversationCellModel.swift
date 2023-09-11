//
//  ConversationCellModel.swift
//  Chat
//
//  Created by Akyl Mukatay  on 09.09.2023.
//

import Foundation

class ConversationCellModel {
    let name: String
    let lastMessageText: String?
    let lastMessageDate: Date
    let isOnline: Bool
    let hasUnreadMessages: Bool
    
    init(
        name: String,
        lastMessageText: String?,
        lastMessageDate: Date,
        isOnline: Bool,
        hasUnreadMessages: Bool
    ) {
        self.name = name
        self.lastMessageText = lastMessageText
        self.lastMessageDate = lastMessageDate
        self.isOnline = isOnline
        self.hasUnreadMessages = hasUnreadMessages
    }
    
    func formattedLastMessageDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: lastMessageDate)
    }
}


