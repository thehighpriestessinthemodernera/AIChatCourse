//
//  ChatModel.swift
//  AIChatCourse
//
//  Created by Intuin  on 19/5/2025.
//
import Foundation

struct ChatModel: Identifiable {
    let id: String
    let userId: String
    let avatarId: String
    let creationDate: Date
    let dateModified: Date

    static var mock: Self {
        mocks[0]
    }
    static var mocks: [Self] {
        let now = Date()
        return [
            ChatModel(
                id: "mock_chat1",
                userId: "user1",
                avatarId: "avatar1",
                creationDate: now,
                dateModified: now
            ),
            ChatModel(
                id: "mock_chat2",
                userId: "user2",
                avatarId: "avatar2",
                creationDate: now.addingTime(hours: -1),
                dateModified: now.addingTime(minutes: -30)
            ),
            ChatModel(
                id: "mock_chat3",
                userId: "user3",
                avatarId: "avatar3",
                creationDate: now.addingTime(days: -1),
                dateModified: now.addingTime(hours: -12)
            ),
            ChatModel(
                id: "mock_chat4",
                userId: "user4",
                avatarId: "avatar4",
                creationDate: now.addingTime(days: -7),
                dateModified: now.addingTime(days: -3, hours: -12)
            )
        ]
    }
}
