//
//  CafesReducer.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/10.
//

import Foundation
import ComposableArchitecture

struct CafesReducer: Reducer {
    struct State: Equatable {
        var cafes: IdentifiedArrayOf<CafeReducer.State>
        var selectedCafe: Cafe?
        
        init(selectedCafe: Cafe? = nil) {
            self.cafes = IdentifiedArrayOf(
                uniqueElements: Cafe.mock.compactMap { CafeReducer.State(cafe: $0) }
            )
            self.selectedCafe = selectedCafe
        }
    }
    
    enum Action {
        case cafe(id: CafeReducer.State.ID, action: CafeReducer.Action)
        case delegate(Delegate)
        
        enum Delegate {
            case selectCafe(Cafe)
        }
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .cafe(id: _, action: .delegate(action)):
                switch action {
                case let .selectCafe(cafe):
                    state.selectedCafe = cafe
                    return .send(.delegate(.selectCafe(cafe)))
                }
            case .delegate:
                return .none
            case .cafe:
                return .none
            }
        }
        .forEach(\.cafes, action: /Action.cafe) {
            CafeReducer()
        }
    }
}
