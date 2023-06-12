//
//  DrinkReducer.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/10.
//

import Foundation
import ComposableArchitecture

struct DrinkReducer: Reducer {
    struct State: Equatable, Identifiable {
        var id: UUID { drink.id }
        let drink: Drink
        var count: Int = 0
    }
    
    enum Action: Equatable {
        case rowTapped
        case addButtonTapped
        case removeButtonTapped
        case closeButtonTapped
        case delegate(Delegate)
        
        enum Delegate: Equatable {
            case tapRow(Drink)
            case addDrink(Drink)
            case removeDrink(Drink)
            case close
        }
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .rowTapped:
            return .send(.delegate(.tapRow(state.drink)))
        case .addButtonTapped:
            state.count += 1
            return .send(.delegate(.addDrink(state.drink)))
        case .removeButtonTapped:
            state.count -= 1
            return .send(.delegate(.removeDrink(state.drink)))
        case .closeButtonTapped:
            return .send(.delegate(.close))
        case .delegate:
            return .none
        }
    }
}
