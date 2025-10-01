//
//  Untitled.swift
//  AIChatCourse
//
//  Created by Intuin  on 30/9/2025.
//
import SwiftUI
import FirebaseFirestore
protocol UserService: Sendable {
    func saveUser(user: UserModel) async throws
    
}

struct FirebaseUserService: UserService {
    
    var collection: CollectionReference {
        Firestore.firestore().collection("users")
    }
    
    func saveUser(user: UserModel) async throws {
        try await collection.document(user.userId).setData(from: user, merge: true)
    }
}


@MainActor
@Observable
class UserManager {
    private let service: UserService
    private(set) var currentUser: UserModel?
    
    init(service: UserService) {
        self.service = service
        self.currentUser = nil
    }
    
    func logIn(auth: UserAuthInfo, isNewUser: Bool) async throws {
        let creationVersion = isNewUser ? Utilities.appVersion : nil
        let user = UserModel(auth: auth, creationVersion: creationVersion ?? "1.0")
        try await service.saveUser(user: user)
    }
}
