//
//  ChatsView.swift
//  AIChatCourse
//
//  Created by Intuin  on 30/4/2025.
//

import SwiftUI

struct ChatsView: View {
    
    @State private var chats: [ChatModel] = ChatModel.mocks
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(chats) { chat in
                    ChatRowCellViewBuilder(
                        currentUserId: nil, //FIXME: Add cuid
                        chat: chat,
                        getAvatar: {
                            try? await Task.sleep(for: .seconds(1))
                            return .mock
                        },
                        getLastChatMessage: {
                            try? await Task.sleep(for: .seconds(1))
                            return .mock
                        },
                    )
                    .anyButton(.highlight, action: {
                        
                    })
                }
            }
            .navigationTitle("Chats")
        }
        .tabItem {
            Label("Chats", systemImage: "bubble.left.and.bubble.right")
        }
        
    }
}

#Preview {
    ChatsView()
}
