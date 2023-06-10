//
//  ContentView.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/04.
//

import SwiftUI

enum Tab {
    case home
    case menu
}

@MainActor
class Root: ObservableObject {
    @Published var selectedTab: Tab = .home
}

struct ContentView: View {
    @EnvironmentObject var root: Root
    
    var body: some View {
        switch root.selectedTab {
        case .home:
            HomeView()
        case .menu:
            NavigationStack {
                MenuView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
