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
        let id: UUID
        var name = ""
        var subtitle = ""
        var imageURL = ""
        var description = ""
        var preparation = ""
        var calories = ""
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
