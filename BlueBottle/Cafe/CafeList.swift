//
//  CafeList.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/10.
//

import SwiftUI

struct CafeList: View {
    @Binding var selectedCafe: Cafe?
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(Cafe.mock) {
                    CafeRow(cafe: $0, selectedCafe: $selectedCafe)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("카페")
                    .font(.title3.bold())
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CafeList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CafeList(selectedCafe: .constant(.mock[0]))
        }
    }
}
