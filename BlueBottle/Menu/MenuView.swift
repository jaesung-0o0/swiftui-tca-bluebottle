//
//  MenuView.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/06.
//

import SwiftUI
import ComposableArchitecture

struct MenuView: View {
    @State private var selectedCafe: Cafe?
    @State private var selectedCategory: String = "추천"
    @State private var isCafeListPresented: Bool = false
    
    let store: StoreOf<MenuReducer>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                CategorySelector(selectedCategory: $selectedCategory)
                
                DrinkList(
                    store: .init(
                        initialState: .init(),
                        reducer: { DrinksReducer() }
                    )
                )
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack(spacing: 4) {
                        Button {
                            isCafeListPresented.toggle()
                        } label: {
                            HStack {
                                Text(selectedCafe?.name ?? "카페를 선택해주세요")
                                    .font(.title3.bold())
                                
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
            .sheet(isPresented: $isCafeListPresented) {
                NavigationStack {
                    CafeList(selectedCafe: $selectedCafe)
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
