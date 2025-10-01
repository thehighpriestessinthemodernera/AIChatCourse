//
//  ChatRowCellView.swift
//  AIChatCourse
//
//  Created by Intuin  on 19/5/2025.
//

import SwiftUI

struct ChatRowCellView: View {
    var imageName: String? = Constants.randomImage
    var headline: String? = "Alpha"
    var subheadline: String? = "This is the last message in the chat."
    var hasNewChat: Bool = true
    
    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                if let imageName {
                    ImageLoaderView(urlString: imageName)
                } else {
                    Rectangle()
                        .fill(.secondary.opacity(0.5))
                }
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                if let headline {
                    Text(headline)
                        .font(.headline)
                }
                if let subheadline {
                    Text(subheadline)
                        .font(.subheadline)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if hasNewChat {
                Text("NEW")
                    .badgeButton()
            }
        }
        .background(Color(uiColor: UIColor.systemBackground))
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()
        
        List {
            ChatRowCellView(headline: nil, subheadline: nil)
                .padding()
            ChatRowCellView(hasNewChat: false)
                .padding()
            ChatRowCellView(imageName: nil)
                .padding()
            ChatRowCellView(headline: nil, hasNewChat: false)
                .padding()
        }
    }
}
