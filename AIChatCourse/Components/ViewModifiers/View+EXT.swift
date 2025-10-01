//
//  View+EXT.swift
//  AIChatCourse
//
//  Created by Intuin  on 4/5/2025.
//

import SwiftUI

extension View {
    func callToActionButton() -> some View {
        self
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.accent)
            .cornerRadius(16)
    }
    
    func badgeButton() -> some View {
        self 
        .font(.caption)
        .bold()
        .foregroundStyle(Color.white)
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
        .background(Color.blue)
        .cornerRadius(6)
    }
    
    func removeListRowFormatting() -> some View {
        self
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .listRowBackground(Color.clear)
    }
    func addingGradientBackgroundForText() -> some View {
        background(
            LinearGradient(colors: [Color.black.opacity(0), Color.black.opacity(0.3), Color.black.opacity(0.4)],
                           startPoint: .top,
                           endPoint: .bottom)
        )
    }
}
