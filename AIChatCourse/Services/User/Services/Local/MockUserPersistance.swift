//
//  MockUserPersistance.swift
//  AIChatCourse
//
//  Created by Intuin  on 2/10/2025.
//


struct MockUserPersistance: LocalUserPersistance {
    let currentUser: UserModel?
    
    init(user: UserModel? = nil) {
        self.currentUser = user
    }
    func getCurrentUser() -> UserModel? {
        currentUser
    }
    
    func saveCurrentUser(user: UserModel?) throws {
        
    }
    
    
}
