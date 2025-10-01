//
//  AppViewBuilder.swift
//  AIChatCourse
//
//  Created by Intuin  on 30/4/2025.
//
import SwiftUI

struct AppViewBuilder<TabbarView: View, OnboardingView: View>: View {
    @Environment(AppState.self) private var appState
    @ViewBuilder var tabbarView: TabbarView
    @ViewBuilder var onboardingView: OnboardingView
    var body: some View {
        ZStack {
            if appState.showTabBar {
                tabbarView
            } else {
                onboardingView
            }
        }
        .animation(.smooth, value: appState.showTabBar)
    }
}

private struct Preview: View {
    @State var showTabBar: Bool = false
    var body: some View {
        AppViewBuilder(
            
            tabbarView: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("Tabbar")
                }
            },
            onboardingView: {
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Onboarding")
                }
            }
        )
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview() {
    Preview()
}
