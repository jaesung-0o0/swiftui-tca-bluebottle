//
//  BlueBottleAppReducer.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/10.
//

import Foundation
import ComposableArchitecture

struct RootReducer: Reducer {
    struct State: Equatable {
        var selectedTab: Tab = .home
        var home = HomeReducer.State()
        var menu = MenuReducer.State()
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
                    state.selectedTab = .menu
                    return .none
                }
            case .home, .menu:
                return .none
            }
        }
        
        Scope(state: \.home, action: /Action.home) {
            HomeReducer()
        }
        
        Scope(state: \.menu, action: /Action.menu) {
            MenuReducer()
        }
    }
}

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

struct MenuReducer: Reducer {
    struct State: Equatable {
        
    }
    
    enum Action {
        
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        
    }
}
