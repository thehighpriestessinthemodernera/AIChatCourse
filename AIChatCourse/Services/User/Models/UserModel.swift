//
//  UserModel.swift
//  AIChatCourse
//
//  Created by Intuin  on 20/5/2025.
//
import Foundation
import SwiftUI

struct UserModel: Codable {
    
    let userId: String
    let email: String?
    let isAnonymous: Bool?
    let creationDate: Date?
    let creationVersion: String?
    let lastSignInDate: Date?
    let didCompleteOnboarding: Bool?
    let profileColorHex: String?
    
    init(
        userId: String,
        email: String? = nil,
        isAnonymous: Bool? = nil,
        creationDate: Date? = nil,
        creationVersion: String? = nil,
        lastSignInDate: Date? = nil,
        didCompleteOnboarding: Bool? = nil,
        profileColorHex: String? = nil
    ) {
        self.userId = userId
        self.email = email
        self.isAnonymous = isAnonymous
        self.creationDate = creationDate
        self.creationVersion = creationVersion
        self.lastSignInDate = lastSignInDate
        self.didCompleteOnboarding = didCompleteOnboarding
        self.profileColorHex = profileColorHex
    }
    
    init(auth: UserAuthInfo, creationVersion: String) {
        self.init(
            userId: auth.uid,
            email: auth.email,
            isAnonymous: auth.isAnonymous,
            creationDate: auth.creationDate,
            creationVersion: creationVersion,
            lastSignInDate: auth.lastSignInDate,
        )
    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case email = "email"
        case isAnonymous = "is_anonymous"
        case creationDate = "creation_date"
        case creationVersion = "creation_version"
        case lastSignInDate = "last_sign_in_date"
        case didCompleteOnboarding = "did_complete_onboarding"
        case profileColorHex = "profile_color_hex"
    }
    
    var profileColorCalculated: Color {
        guard let profileColorHex else {
            return .accent
        }
        return Color(hex: profileColorHex) ?? .accent
    }
    
    static var mock: Self {
        mocks[0]
    }
    static var mocks: [Self] {
        let now = Date()
        return [
            UserModel(
                userId: "user_001",
                creationDate: now.addingTime(days: -1, hours: -2), // 1 day 2 hours ago
                didCompleteOnboarding: true,
                profileColorHex: "#FFC0CB"
            ),
            UserModel(
                userId: "user_002",
                creationDate: now.addingTime(hours: -6), // 6 hours ago
                didCompleteOnboarding: false,
                profileColorHex: "#87CEEB"
            ),
            UserModel(
                userId: "user_003",
                creationDate: now.addingTime(days: -3, minutes: -15), // 3 days 15 minutes ago
                didCompleteOnboarding: true,
                profileColorHex: "#98FB98"
            ),
            UserModel(
                userId: "user_004",
                creationDate: nil,
                didCompleteOnboarding: nil,
                profileColorHex: nil
            )
        ]
    }
}
