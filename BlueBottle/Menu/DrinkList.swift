//
//  DrinkList.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/06.
//

import SwiftUI
import ComposableArchitecture

struct DrinkList: View {
    let store: StoreOf<DrinksReducer>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            List {
                ForEachStore(
                    store.scope(
                        state: \.drinks,
                        action: DrinksReducer.Action.drink
                    )
                ) { drinkStore in
                    DrinkRow(store: drinkStore)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
    }
}
