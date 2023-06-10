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

struct ContentView: View {
    let store: StoreOf<RootReducer>
    
    var body: some View {
        SwitchStore(self.store) { state in
            switch state {
            case .home:
                CaseLet(/RootReducer.State.home, action: RootReducer.Action.home) { homeStore in
                    HomeView(store: homeStore)
                }
            case .menu:
                CaseLet(/RootReducer.State.menu, action: RootReducer.Action.menu) { menuStore in
                    NavigationStack {
                        MenuView(store: menuStore)
                    }
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
