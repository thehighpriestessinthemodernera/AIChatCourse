//
//  AIChatCourseApp.swift
//  AIChatCourse
//
//  Created by Intuin  on 24/4/2025.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct AIChatCourseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State private var appState = AppState()
    var body: some Scene {
        WindowGroup {
            EnvironmentBuilderView {
                AppView(appState: appState)
                    .environment(appState)
            }
        }
    }
}

struct EnvironmentBuilderView<Content: View>: View {
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        content()
            .environment(AuthManager(service: FirebaseAuthService()))
            .environment(UserManager(service: FirebaseUserService()))
            
    }
}
