//
//  MenuView.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/06.
//

import SwiftUI
import ComposableArchitecture

struct MenuView: View {
    @State private var selectedCategory: String = "추천"
    @State private var addedDrinks: [Drink] = []
    
    let store: StoreOf<MenuReducer>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(spacing: 0) {
                CategorySelector(selectedCategory: $selectedCategory)
                
                DrinkList(
                    store: .init(
                        initialState: .init(),
                        reducer: { DrinksReducer() }
                    )
                )
                
                if !addedDrinks.isEmpty {
                    Button {
                        // TODO: 결제
                    } label: {
                        HStack {
                            Spacer()
                            
                            Text("3 잔")
                                .font(.footnote)
                            
                            Text("총 15000 원")
                        }
                        .foregroundColor(.white)
                        .padding(.vertical, 32)
                        .padding(.bottom, 32)
                        .padding(.horizontal, 16)
                        .background {
                            Color("bluebottle.blue")
                                .frame(width: UIScreen.main.bounds.width)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .ignoresSafeArea(edges: [.bottom])
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack(spacing: 4) {
                        Button {
                            viewStore.send(.cafePresenterButtonTapped)
                        } label: {
                            HStack {
                                Text(viewStore.selectedCafe?.name ?? "카페를 선택해주세요")
                                    .font(.headline)
                                
                                Image(systemName: "chevron.down")
                                    .font(.caption)
                                    .foregroundColor(Color("bluebottle.blue"))
                            }
                        }
                        .buttonStyle(.plain)
                        
                        Text("영업중")
                            .font(.footnote)
                    }
                }
            }
            .sheet(
                store: store.scope(
                    state: \.$cafeSelection,
                    action: { .cafeSelection($0) }
                )
            ) { cafesStore in
                NavigationStack {
                    CafeList(store: cafesStore)
                }
            }
        }
    }
}

struct MenuView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MenuView(
                store: .init(
                    initialState: .init(),
                    reducer: { MenuReducer() }
                )
            )
        }
    }
}
