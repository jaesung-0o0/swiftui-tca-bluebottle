//
//  HomeReducer.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/10.
//

import Foundation
import ComposableArchitecture

struct HomeReducer: Reducer {
    struct State: Equatable {
        
    }
    
    enum Action {
        case orderButtonTapped
        case delegate(Delegate)
        
        enum Delegate: Equatable {
            case switchToMenuView
        }
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .orderButtonTapped:
            return .send(.delegate(.switchToMenuView))
        case .delegate:
            return .none
        }
    }
}
