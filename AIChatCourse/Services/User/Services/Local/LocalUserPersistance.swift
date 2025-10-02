//
//  LocalUserPersistance.swift
//  AIChatCourse
//
//  Created by Intuin  on 2/10/2025.
//


protocol LocalUserPersistance {
    func getCurrentUser() -> UserModel?
    func saveCurrentUser(user: UserModel?) throws
}