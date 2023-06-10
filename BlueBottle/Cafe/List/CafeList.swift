//
//  CafeList.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/10.
//

import SwiftUI
import ComposableArchitecture

struct CafeList: View {
    let store: StoreOf<CafesReducer>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEachStore(
                        store.scope(
                            state: \.cafes,
                            action: CafesReducer.Action.cafe
                        )
                    ) { store in
                        CafeRow(store: store)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("카페")
                        .font(.headline)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CafeList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CafeList(
                store: .init(
                    initialState: .init(),
                    reducer: { CafesReducer() }
                )
            )
        }
    }
}
