//
//  ChatRowCellViewBuilder.swift
//  AIChatCourse
//
//  Created by Intuin  on 20/5/2025.
//

import SwiftUI

struct ChatRowCellViewBuilder: View {
    
    var currentUserId: String? = ""
    var chat: ChatModel = .mock
    var getAvatar: () async -> AvatarModel?
    var getLastChatMessage: () async -> ChatMessageModel?
    
    @State private var avatar: AvatarModel?
    @State private var lastChatMessage: ChatMessageModel?
    
    @State var didLoadAvatar: Bool = false
    @State var didLoadChatMessage: Bool = false
    
    private var isLoading: Bool {
        if didLoadAvatar && didLoadChatMessage {
            return false
        }
        return true
        }
    
    private var hasNewChat: Bool {
        guard let lastChatMessage, let currentUserId else { return false }
        return lastChatMessage.hasBeenSeenByCurrentUser(userId: currentUserId)
    }
    
    private var subheadline: String? {
        if isLoading {
            return "xxx xxx xxx xxxxx xx"
        }
        if avatar == nil && lastChatMessage == nil {
            return "Error loading data"
        }
        return lastChatMessage?.content
    }
    var body: some View {
        ChatRowCellView(
            imageName: avatar?.profileImageName,
            headline: isLoading ? "xxx xxx" : avatar?.name,
            subheadline: isLoading ? "xxx xxx xxxxx" : lastChatMessage?.content,
            hasNewChat: isLoading ? false : hasNewChat
            )
        .redacted(reason: isLoading ? .placeholder : [] )
        .task {
            // get the avatar
            avatar = await getAvatar()
            didLoadAvatar = true
        }
        .task {
            // get the avatar
            lastChatMessage = await getLastChatMessage()
            didLoadChatMessage = true
        }
    }
   
}

#Preview {
    VStack {
        ChatRowCellViewBuilder(chat: .mock, getAvatar: {
            try? await Task.sleep(for: .seconds(5))
            return .mock
        }, getLastChatMessage: {
            try? await Task.sleep(for: .seconds(5))
            return .mock
        })
        
        ChatRowCellViewBuilder(chat: .mock, getAvatar: {
            .mock
        }, getLastChatMessage: {
            .mock
        })
        
        ChatRowCellViewBuilder(chat: .mock, getAvatar: {
            nil
        }, getLastChatMessage: {
            nil
        })
    }
}
