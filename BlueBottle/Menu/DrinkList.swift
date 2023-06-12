//
//  DrinkList.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/06.
//

import SwiftUI
import ComposableArchitecture

struct DrinkList: View {
//    @Binding var selection: Drink?
    let store: StoreOf<DrinksReducer>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            // TODO: selection
            List {
                ForEachStore(
                    store.scope(
                        state: \.drinks,
                        action: DrinksReducer.Action.drink
                    )
                ) { drinkStore in
                    DrinkRow(store: drinkStore)
                        .listRowSeparator(.hidden)
                        .listRowInsets(
                            .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                        )
                }
            }
            .listStyle(.plain)
            .sheet(
                store: store.scope(
                    state: \.$selectedDrink,
                    action: { .selectedDrink($0) }
                )
            ) { drinkStore in
                DrinkDetailView(store: drinkStore)
            }
        }
    }
}
