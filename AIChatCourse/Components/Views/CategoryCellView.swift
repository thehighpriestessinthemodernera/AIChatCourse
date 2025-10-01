//
//  CategoryCellView.swift
//  AIChatCourse
//
//  Created by Intuin  on 17/5/2025.
//

import SwiftUI

struct CategoryCellView: View {
    var title: String = "Aliens"
    var imageName: String = Constants.randomImage
    var font: Font = .title2
    var cornerRadius: CGFloat = 16
    
    var body: some View {
        ImageLoaderView(urlString: imageName)
            .aspectRatio(1, contentMode: .fit)
            .overlay(alignment: .bottomLeading, content: {
                Text(title)
                    .font(font)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .addingGradientBackgroundForText()
                
            })
            .cornerRadius(cornerRadius)
    }
}

#Preview {
    VStack {
        CategoryCellView()
            .frame(width: 150)
        CategoryCellView()
            .frame(width: 300) 
    }
}
