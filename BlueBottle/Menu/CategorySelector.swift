//
//  CategorySelector.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/07.
//

import SwiftUI

struct CategorySelector: View {
    @Binding var selectedCategory: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 32) {
                MenuCateogyColumn(
                    title: "추천",
                    selectedCategory: $selectedCategory
                )
                .padding(.leading, 32)
                
                MenuCateogyColumn(
                    title: "에스프레소",
                    selectedCategory: $selectedCategory
                )
                
                MenuCateogyColumn(
                    title: "커피",
                    selectedCategory: $selectedCategory
                )
                
                MenuCateogyColumn(
                    title: "차",
                    selectedCategory: $selectedCategory
                )
                
                MenuCateogyColumn(
                    title: "스파클링",
                    selectedCategory: $selectedCategory
                )
            }
        }
        .frame(height: 64)
    }
}
