//
//  UserAuthInfo.swift
//  AIChatCourse
//
//  Created by Intuin  on 23/9/2025.
//
import SwiftUI

struct UserAuthInfo: Sendable {
    let uid: String
    let email: String?
    let isAnonymous: Bool
    let creationDate: Date?
    let lastSignInDate: Date?
    
    init(
        uid: String,
        email: String? = nil,
        isAnonymous: Bool = false,
        creationDate: Date? = nil,
        lastSignInDate: Date? = nil
    ) {
        self.uid = uid
        self.email = email
        self.isAnonymous = isAnonymous
        self.creationDate = creationDate
        self.lastSignInDate = lastSignInDate
    }
    
    static func mock(isAnonymous: Bool = false) -> Self {
        UserAuthInfo(uid: "mock_user_123",
                     email: "hello@swiftul-thinking.com",
                     isAnonymous: isAnonymous,
                     creationDate: .now,
                     lastSignInDate: .now
        )
    }
}
