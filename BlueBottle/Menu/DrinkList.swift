//
//  DrinkList.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/06.
//

import SwiftUI

struct DrinkList: View {
    var body: some View {
        List(Drink.fetchDrinks()) {
            DrinkRow(drink: $0)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}
