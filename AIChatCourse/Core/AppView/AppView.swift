//
//  AppView.swift
//  AIChatCourse
//
//  Created by Intuin  on 28/4/2025.
//

import SwiftUI
struct AppView: View {
    
    @Environment(AuthManager.self) private var authManager
    @Environment(UserManager.self) private var userManager
    @State var appState: AppState = AppState()
    
    var body: some View {
        print("App view body is running")
            return AppViewBuilder(
                tabbarView: {
                    TabBarView()
                },
                onboardingView: {
                    WelcomeView()
                }
            )
            .environment(appState)
        
            .task {
                print("Starting check") 
                await checkUserStatus()
            }
            .onChange(of: appState.showTabBar) { _, showTabBar in
                if !showTabBar {
                    Task {
                        await checkUserStatus()
                    }
                }
            }
        }
    private func checkUserStatus() async {
        if let user = authManager.auth {
            // User is authenticated
            print("User already authenticated: \(user.uid)")
            do {
                try await userManager.logIn(auth: user, isNewUser: false)
            } catch {
                print("Failed to log in to auth for existing user: \(error)")
                try? await Task.sleep(for: .seconds(5))
                await checkUserStatus()
            }
            
        } else {
            // User is not authenticated
            do {
                let result = try await authManager.signInAnonymously()
                print("Sign In Anonymous success: \(result.user.uid)")
                try await userManager.logIn(auth: result.user, isNewUser: result.isNewUser)
            }
            catch {
                print("Failed to sign in anonymously and log in: \(error)")
                try? await Task.sleep(for: .seconds(5))
                await checkUserStatus()
            }
        }
    }
    }

#Preview("AppView - Tabbar") {
    AppView(appState: AppState(showTabBar: true))
}
#Preview("AppView - Onboarding") {
    AppView(appState: AppState(showTabBar: false))
}
