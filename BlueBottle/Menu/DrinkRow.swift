//
//  DrinkRow.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/07.
//

import SwiftUI

struct DrinkRow: View {
    let drink: Drink
    
    var body: some View {
        ZStack(alignment: .top) {
            AsyncImage(url: URL(string: drink.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.width
                    )
                    .clipped()
            } placeholder: {
                Color.secondary.opacity(0.2)
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.width
                    )
                    .clipped()
            }
            
            VStack(spacing: 12) {
                Text(drink.name)
                    .font(.headline)
                
                Text(drink.subtitle)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                
//                Text(drink.description)
//
//                Text("운영시간: 매일 08:30 - 19:00")
//
//                Text("대설 및 태풍 등의 자연재해 시, 단축 영업 또는 임시 휴무")
            }
            .font(.subheadline)
            .padding(.top, 20)
            .padding(.horizontal, 12)
        }
    }
}
