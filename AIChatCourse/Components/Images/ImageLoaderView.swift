//
//  ImageLoaderView.swift
//  AIChatCourse
//
//  Created by Intuin  on 6/5/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    var urlString: String = Constants.randomImage
    var resizingMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay(WebImage(url: URL(string: urlString))
                      .resizable()
                      .indicator(.activity)
                      .aspectRatio(contentMode: resizingMode)

                      .allowsHitTesting(false)
            )
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
        .frame(width: 250, height: 250)
}
