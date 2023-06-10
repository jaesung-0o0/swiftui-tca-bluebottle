//
//  CafeRow.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/10.
//

import SwiftUI
import ComposableArchitecture

struct CafeRow: View {
    let store: StoreOf<CafeReducer>
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                AsyncImage(url: URL(string: viewStore.cafe.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(
                            width: UIScreen.main.bounds.width,
                            height: UIScreen.main.bounds.width
                        )
                        .clipped()
                } placeholder: {
                    Color.secondary.opacity(0.2)
                        .frame(
                            width: UIScreen.main.bounds.width,
                            height: UIScreen.main.bounds.width
                        )
                        .clipped()
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(viewStore.cafe.name)
                        .font(.title3.bold())
                    
                    Text(viewStore.cafe.address)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                    
                    Button {
                        viewStore.send(.cafeTapped)
                    } label: {
                        Text("카페 선택")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(12)
                            .background {
                                Color.accentColor
                            }
                    }
                    
                    Divider()
                    
                    HStack {
                        Button {
                            viewStore.send(.expandingButtonTapped)
                        } label: {
                            Image(systemName: "chevron.down")
                                .font(.footnote)
                                .foregroundColor(.accentColor)
                                .rotationEffect(viewStore.isExpanded ? .degrees(-180) : .zero)
                                .animation(.default, value: viewStore.isExpanded)
                        }
                        
                        Text("운영시간")
                            .font(.footnote.bold())
                            .foregroundColor(.secondary)
                    }
                    
                    if viewStore.isExpanded {
                        ForEach(viewStore.cafe.hours, id: \.text) {
                            Text($0.text)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Divider()
                        .animation(.default, value: viewStore.isExpanded)
                    
                    if let information = viewStore.cafe.information {
                        Text(information) // Text("대설 및 태풍 등의 자연재해 시, 단축 영업 또는 임시 휴무")
                    }
                }
                .font(.subheadline)
                .padding(.top, 20)
                .padding(.horizontal, 12)
            }
        }
    }
}

struct CafeRow_Previews: PreviewProvider {
    static var previews: some View {
        CafeRow(
            store: .init(
                initialState: .init(cafe: Cafe.mock[0]),
                reducer: { CafeReducer() }
            )
        )
    }
}
