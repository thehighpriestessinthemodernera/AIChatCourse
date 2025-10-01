//
//  WelcomeView.swift
//  AIChatCourse
//
//  Created by Intuin  on 30/4/2025.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var imageName: String = Constants.randomImage
    @State private var showSignInView: Bool = false
    @Environment(AppState.self) private var root

    var body: some View {
        NavigationStack {
            VStack {
                ImageLoaderView(urlString: imageName)
                    .frame(height: 500)
                    .ignoresSafeArea()
                title
                ctaButtons
                .padding(16)
                policyLinks
                Spacer()
            }
        }
        .sheet(isPresented: $showSignInView) {
            CreateAccountView(
                title: "Sign In",
                subtitle: "Connect to an existing account",
                onDidSignIn: { isNewUser in
                    handleDidSignIn(isNewUser: isNewUser)
                }
            )
                .presentationDetents([.medium])
        }
    }
    
    private var title: some View {
        VStack {
            Text("AI Chat")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text("YouTube @ SwiftuiThinking")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
    private var ctaButtons: some View {
        VStack {
            NavigationLink {
                OnboardingIntroView()
            } label: {
                Text("Get Started")
                    .callToActionButton()
            }
            
            Text("Already have an account? Sign in")
                .underline()
                .font(.body)
                .padding(8)
                .onTapGesture {
                    onSignInPressed()
                }
        }
    }
    private var policyLinks: some View {
        HStack {
            Link(destination: URL(string: Constants.termsOfServiceUrl)!) {
                Text("Terms of Service")
            }
            Circle()
                .fill(.accent)
                .frame(width: 4, height: 4)
            Link(destination: URL(string: Constants.privacyPolicyUrl)!) {
                Text("Privacy Policy")
            }
        }
    }
    
    private func handleDidSignIn(isNewUser: Bool) {
        if isNewUser {
            //do nothing, user goes through onboarding
        } else {
            root.updateViewState(showTabBarView: true)
        }
    }
    
    private func onSignInPressed() {
        showSignInView = true
    }
}

#Preview {
    NavigationStack {
        WelcomeView()
    }
    .environment(AppState())
}
