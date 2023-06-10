//
//  BlueBottleApp.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/04.
//

import SwiftUI

@main
struct BlueBottleApp: App {
    @StateObject var root = Root()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(root)
        }
    }
}
