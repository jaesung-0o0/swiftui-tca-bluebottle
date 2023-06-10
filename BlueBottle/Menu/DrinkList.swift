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
                ) {
                    DrinkRow(store: $0)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
    }
}
