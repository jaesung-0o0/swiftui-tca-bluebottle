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
        var addedDrinks: [Drink.ID: Int] = [:]
        @PresentationState var selectedDrink: DrinkReducer.State?
        
        init() {
            self.drinks = IdentifiedArrayOf(
                uniqueElements: Drink.fetchDrinks().compactMap { DrinkReducer.State(drink: $0) }
            )
        }
    }
    
    enum Action: Equatable {
        case selectedDrink(PresentationAction<DrinkReducer.Action>)
        case categoryItemTapped(String)
        case drink(id: DrinkReducer.State.ID, action: DrinkReducer.Action)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .drink(id: id, action: .delegate(.tapRow(drink))):
                let count = state.addedDrinks[id] ?? 0
                state.selectedDrink = DrinkReducer.State(drink: drink, count: count)
                return .none
                
            case let .selectedDrink(.presented(.delegate(action))):
                switch action {
                case .tapRow:
                    return .none
                    
                case let .addDrink(drink):
                    let count = state.addedDrinks[drink.id] ?? 0
                    state.addedDrinks.updateValue(count + 1, forKey: drink.id)
                    return .none
                    
                case let .removeDrink(drink):
                    guard let count = state.addedDrinks[drink.id], count > 0 else {
                        return .none
                    }
                    state.addedDrinks.updateValue(count - 1, forKey: drink.id)
                    return .none
                    
                case .close:
                    state.selectedDrink = nil
                    return .none
                }
                
            case let .categoryItemTapped(categoryID):
                state.selectedCategory = categoryID
                // TODO: filter drinks
                return .none
                
            case .drink, .selectedDrink:
                return .none
            }
        }
        .forEach(\.drinks, action: /Action.drink(id:action:)) {
            DrinkReducer()
        }
        .ifLet(\.$selectedDrink, action: /Action.selectedDrink) {
            DrinkReducer()
        }
    }
}

