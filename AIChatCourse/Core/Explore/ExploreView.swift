//
//  ExploreView.swift
//  AIChatCourse
//
//  Created by Intuin  on 30/4/2025.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var featuredAvatars: [AvatarModel] = AvatarModel.mocks
    @State private var categories: [CharacterOption] = CharacterOption.allCases
    @State private var popularAvatars: [AvatarModel] = AvatarModel.mocks

    var body: some View {
        NavigationStack {
            List {
                featuredSection
                categorySection
                popularSection
            }
            .navigationTitle("Explore")
        }
        .tabItem {
            Label("Explore", systemImage: "eyes")
        }
        }
    
    private var featuredSection: some View {
        Section(header: Text("Featured")) {
            CarouselView(items: featuredAvatars) { avatar in
                HeroCellView(title: avatar.name, subtitle: avatar.characterDescription, imageName: avatar.profileImageName
                )
                .anyButton {
                    
                }
            }
        }
        .removeListRowFormatting()
    }
    
    private var categorySection: some View {
        Section(header: Text("Categories")) {
            ZStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(categories, id: \.self) { category in
                            CategoryCellView(title: category.rawValue.capitalized, imageName: Constants.randomImage)
                        }
                    }
                }
            }
            .frame(height: 140)
            .scrollIndicators(.hidden)
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
            
        }
        .removeListRowFormatting()
        
    }
    private var popularSection: some View {
        Section(header: Text("Popular")) {
            ForEach(popularAvatars, id: \.self) { avatar in
                CustomListCellView(
                    imageName: avatar.profileImageName ?? "Alpha",
                    title: avatar.name,
                    subtitle: avatar.characterDescription
                )
                .anyButton(.highlight) {
                    
                }
                .removeListRowFormatting()
            }
           
        }
    }
    }
#Preview {
    ExploreView()
}
