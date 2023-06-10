//
//  HomeView.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/06.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View, PreviewProvider {
    let store: StoreOf<HomeReducer>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(spacing: 0) {
                Image("photo.cafe")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped() // animation: move right to left slowly
                
                Button {
                    viewStore.send(.orderButtonTapped)
                } label: {
                    Text("주문 시작하기")
                        .foregroundColor(Color(.systemBackground))
                        .padding(.vertical, 32)
                        .padding(.bottom, 32)
                        .background {
                            Color("bluebottle.blue")
                                .frame(width: UIScreen.main.bounds.width)
                        }
                }
                .buttonStyle(.plain)
            }
            .ignoresSafeArea(edges: [.vertical])
        }
    }
    static var previews: some View {
        Self(store: Store(initialState: .init(), reducer: { HomeReducer() }))
//            .previewLayout(.sizeThatFits)
    }
}
