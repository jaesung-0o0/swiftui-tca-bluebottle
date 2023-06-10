//
//  BlueBottleAppReducer.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/10.
//

import Foundation
import ComposableArchitecture

struct RootReducer: Reducer {
    enum State {
        case home(HomeReducer.State)
        case menu(MenuReducer.State)
        
        init() {
            self = .home(.init())
        }
    }
    
    enum Action {
        case home(HomeReducer.Action)
        case menu(MenuReducer.Action)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .home(.delegate(action)):
                switch action {
                case .switchToMenuView:
                    state = .menu(.init())
                    return .none
                }
            case .home, .menu:
                return .none
            }
        }
        .ifCaseLet(/State.home, action: /Action.home) {
            HomeReducer()
        }
        .ifCaseLet(/State.menu, action: /Action.menu) {
            MenuReducer()
        }
        
        /// ```
        /// Action:
        ///     RootReducer.Action.home(.delegate(.switchToMenuView))
        /// State:
        ///     RootReducer.State.menu
        /// ```
        /// A parent reducer set "RootReducer.State" to a different case before the scoped reducer ran. Child reducers must run before any parent reducer sets child state to a different case. This ensures that child reducers can handle their actions while their state is still available.
        /// **Consider using "Reducer.ifCaseLet" to embed this child reducer in the parent reducer that change its state to ensure the child reducer runs first.**
//        Scope(state: /State.home, action: /Action.home) {
//            HomeReducer()
//        }
//
//        Scope(state: /State.menu, action: /Action.menu) {
//            MenuReducer()
//        }
    }
}
