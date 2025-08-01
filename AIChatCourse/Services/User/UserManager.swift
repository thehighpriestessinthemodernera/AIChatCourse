//
//  UserManager.swift
//  AIChatCourse
//
//  Created by Intuin  on 31/7/2025.
//
import SwiftUI

protocol UserService: Sendable {
    func saveUser(user: UserModel) async throws
}

import FirebaseFirestore
struct FirebaseUserService: UserService {
    
    var collection: CollectionReference {
        Firestore.firestore().collection("users")
    }
    
    func saveUser(user: UserModel) async throws {
        try collection.document(user.userId).setData(from: user, merge: true)
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
        
        let user = UserModel(auth: auth, creationVersion: "1.0")
        try await service.saveUser(user: user)
    }
}
