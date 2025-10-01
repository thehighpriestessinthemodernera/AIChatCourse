//
//  OnboardingCompletedView.swift
//  AIChatCourse
//
//  Created by Intuin  on 2/5/2025.
//

import SwiftUI

struct OnboardingCompletedView: View {
    @Environment(AppState.self) private var root
    
    var selectedColor: Color = .orange
    @State private var isCompletingProfileSetup: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Setup complete!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(selectedColor)
            Text("We have set up your profile and you're ready to start chatting.")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
            
        }
        .padding(24)
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom, content: {
            ctaButton
        })
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var ctaButton: some View {
        Button {
           onFinishButtonPressed()
        } label: {
            ZStack {
                if isCompletingProfileSetup {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text("Finish")
                }
            }
            .callToActionButton()
        }
        .disabled(isCompletingProfileSetup)
    }
    
    func onFinishButtonPressed() {
        print("Called Finish Button")
        isCompletingProfileSetup = true
        Task {
            try await Task.sleep(for: .seconds(3))
            isCompletingProfileSetup = false
            root.updateViewState(showTabBarView: true)
        }
    }
}

#Preview {
    NavigationStack {
        OnboardingCompletedView(selectedColor: .mint)
            .environment(AppState())
    }
        
}
