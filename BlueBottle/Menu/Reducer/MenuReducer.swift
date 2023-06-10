//
//  MenuReducer.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/10.
//

import Foundation
import ComposableArchitecture

struct MenuReducer: Reducer {
    struct State: Equatable {
        @PresentationState var cafeSelection: CafesReducer.State?
        var selectedCafe: Cafe?
        var drinks = DrinksReducer.State()
    }
    
    enum Action {
        case cafePresenterButtonTapped
        case cafeSelection(PresentationAction<CafesReducer.Action>)
        case drinks(DrinksReducer.Action)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .cafePresenterButtonTapped:
                state.cafeSelection = CafesReducer.State(selectedCafe: state.selectedCafe)
                return .none
            case let .cafeSelection(.presented(.delegate(.selectCafe(cafe)))):
                state.selectedCafe = cafe
                state.cafeSelection = nil
                return .none
            case .cafeSelection:
                return .none
            case .drinks:
                return .none
            }
        }
        .ifLet(\.$cafeSelection, action: /Action.cafeSelection) {
            CafesReducer()
        }
    }
}
