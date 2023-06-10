//
//  MenuCateogyColumn.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/07.
//

import SwiftUI

struct MenuCateogyColumn: View {
    let title: String
    @Binding var selectedCategory: String
    
    var body: some View {
        Button {
            selectedCategory = title
        } label: {
            Text(title)
                .font(.headline)
        }
        .buttonStyle(.plain)
        .foregroundColor(
            title == selectedCategory
            ? Color("bluebottle.blue")
            : .secondary
        )
    }
}
