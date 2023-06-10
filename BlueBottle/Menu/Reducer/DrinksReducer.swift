//
//  DrinksReducer.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/10.
//

import Foundation
import OrderedCollections
import ComposableArchitecture

struct DrinksReducer: Reducer {
    struct State: Equatable {
        var drinks: IdentifiedArrayOf<DrinkReducer.State> = []
        var selectedDrink: OrderedSet<DrinkReducer.State.ID> = []
    }
    
    enum Action {
        case drink(id: DrinkReducer.State.ID, action: DrinkReducer.Action)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .drink(id: id, action: .drinkTapped):
                state.selectedDrink.append(id)
                return .none
            }
        }
        .forEach(\.drinks, action: /Action.drink(id:action:)) {
            DrinkReducer()
        }
    }
}
