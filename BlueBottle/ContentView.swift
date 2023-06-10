//
//  ContentView.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/04.
//

import SwiftUI
import ComposableArchitecture

enum Tab {
    case home
    case menu
}

@MainActor
class Root: ObservableObject {
    @Published var selectedTab: Tab = .home
}

struct ContentView: View {
    let store: StoreOf<RootReducer>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            switch viewStore.selectedTab {
            case .home:
                HomeView(
                    store: self.store.scope(
                        state: \.home,
                        action: RootReducer.Action.home
                    )
                )
            case .menu:
                NavigationStack {
                    MenuView(
                        store: self.store.scope(
                            state: \.menu,
                            action: RootReducer.Action.menu
                        )
                    )
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: .init(
            initialState: .init(),
            reducer: { RootReducer() })
        )
    }
}
