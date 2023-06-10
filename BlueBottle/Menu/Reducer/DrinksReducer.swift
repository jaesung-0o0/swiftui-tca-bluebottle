//
//  DrinksReducer.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/10.
//

import Foundation
import ComposableArchitecture

struct DrinksReducer: Reducer {
    struct State: Equatable {
        var drinks: IdentifiedArrayOf<DrinkReducer.State> = []
        var selectedCategory: String = ""
        var selectedDrink: Set<DrinkReducer.State.ID> = []
        
        init() {
            self.drinks = IdentifiedArrayOf(
                uniqueElements: Drink.fetchDrinks().compactMap { DrinkReducer.State(drink: $0) }
            )
        }
    }
    
    enum Action {
        case categoryItemTapped(String)
        case drink(id: DrinkReducer.State.ID, action: DrinkReducer.Action)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .categoryItemTapped(categoryID):
                state.selectedCategory = categoryID
                // TODO: filter drinks
                return .none
            case let .drink(id: id, action: .drinkTapped):
                state.selectedDrink.insert(id)
                return .none
            }
        }
        .forEach(\.drinks, action: /Action.drink(id:action:)) {
            DrinkReducer()
        }
    }
}

