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
    }
    
    enum Action {
        case drinkTapped
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .drinkTapped:
            return .none
        }
    }
}
