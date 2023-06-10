//
//  HomeView.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/06.
//

import SwiftUI

struct HomeView: View, PreviewProvider {
    @EnvironmentObject var root: Root
    
    var body: some View {
        VStack(spacing: 0) {
            Image("photo.cafe")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .clipped() // animation: move right to left slowly
            
            Button {
                root.selectedTab = .menu
            } label: {
                Text("주문 시작하기")
                    .foregroundColor(Color(.systemBackground))
                    .padding(.vertical, 32)
                    .padding(.bottom, 32)
                    .background {
                        Color("bluebottle.blue")
                            .frame(width: UIScreen.main.bounds.width)
                    }
            }
            .buttonStyle(.plain)
        }
        .ignoresSafeArea(edges: [.vertical])
    }
    static var previews: some View {
        Self()
//            .previewLayout(.sizeThatFits)
    }
}
