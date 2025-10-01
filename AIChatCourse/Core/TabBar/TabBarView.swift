//
//  TabBarView.swift
//  AIChatCourse
//
//  Created by Intuin  on 30/4/2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        NavigationStack {
            TabView {
                ExploreView()
                ChatsView()
                ProfileView()
            }
        }
    }
}

#Preview {
    NavigationStack {
        TabBarView()
    }
}
