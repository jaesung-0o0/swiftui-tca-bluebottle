//
//  CafeReducer.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/10.
//

import Foundation
import ComposableArchitecture

struct CafeReducer: Reducer {
    struct State: Equatable, Identifiable {
        var id: String { cafe.id }
        let cafe: Cafe
        var isExpanded = false
    }
    
    enum Action {
        case cafeTapped
        case expandingButtonTapped
        case delegate(Delegate)
        
        enum Delegate {
            case selectCafe(Cafe)
        }
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .cafeTapped:
            return .send(.delegate(.selectCafe(state.cafe)))
        case .expandingButtonTapped:
            state.isExpanded.toggle()
            return .none
        case .delegate:
            return .none
        }
    }
}
