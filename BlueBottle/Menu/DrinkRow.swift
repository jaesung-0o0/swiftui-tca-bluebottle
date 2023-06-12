//
//  DrinkRow.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/07.
//

import SwiftUI
import ComposableArchitecture

struct DrinkRow: View {
    let store: StoreOf<DrinkReducer>
    
    var body: some View {
        WithViewStore(self.store, observe: \.drink) { viewStore in
            ZStack(alignment: .top) {
                AsyncImage(url: URL(string: viewStore.imageURL)) { image in
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
                    Text(viewStore.name)
                        .font(.headline)
                    
                    Text(viewStore.subtitle)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                }
                .font(.subheadline)
                .padding(.top, 20)
                .padding(.horizontal, 12)
            }
            .onTapGesture {
                viewStore.send(.rowTapped)
            }
        }
    }
}
