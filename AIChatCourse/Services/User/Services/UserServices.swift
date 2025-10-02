//
//  UserServices.swift
//  AIChatCourse
//
//  Created by Intuin  on 2/10/2025.
//

protocol UserServices {
    var remote: RemoteUserService { get }
    var local: LocalUserPersistance { get }
}

struct MockUserServices: UserServices {
     let remote: RemoteUserService
     let local: LocalUserPersistance
    
    init(user: UserModel? = nil) {
        self.remote = MockUserService(user: user)
        self.local = MockUserPersistance(user: user)
    }
}

struct ProductionUserServices: UserServices {
     let remote: RemoteUserService = FirebaseUserService()
     let local: LocalUserPersistance = FileManagerUserPersistance()
}
