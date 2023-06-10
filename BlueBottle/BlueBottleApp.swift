//
//  BlueBottleApp.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/04.
//

import SwiftUI

@main
struct BlueBottleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: .init(
                    initialState: .init(),
                    reducer: { RootReducer()._printChanges() }
                )
            )
        }
    }
}
