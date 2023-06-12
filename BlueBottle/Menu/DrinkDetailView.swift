//
//  DrinkDetailView.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/11.
//

import SwiftUI
import ComposableArchitecture

struct DrinkDetailView: View {
    let store: StoreOf<DrinkReducer>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack(alignment: .topLeading) {
                VStack(spacing: 0) {
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 20) {
                            AsyncImage(url: URL(string: viewStore.drink.imageURL)) { image in
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
                            
                            VStack(spacing: 12) {
                                Text(viewStore.drink.name.uppercased())
                                    .font(.headline)
                                
                                Text(viewStore.drink.subtitle)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.center)
                            }
                            .padding(.horizontal, 20)
                            
                            VStack(spacing: 20) {
                                Divider()
                                
                                HStack {
                                    Text("TYPE")
                                        .font(.footnote)
                                    
                                    Spacer()
                                    
                                    Text(viewStore.drink.preparation)
                                        .bold()
                                    
                                    Button {
                                        // TODO:
                                    } label: {
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(.accentColor)
                                    }
                                }
                                
                                Divider()
                                
                                HStack {
                                    Text("CALORIES")
                                        .font(.footnote)
                                    
                                    Spacer()
                                    
                                    Text(viewStore.drink.calories)
                                        .bold()
                                    
                                    Button {
                                        // TODO:
                                    } label: {
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(.accentColor)
                                    }
                                }
                                
                                Divider()
                            }
                            
                            Text(viewStore.drink.description)
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    Button {
                        viewStore.send(.addButtonTapped)
                    } label: {
                        VStack(spacing: 12) {
                            Text("한 잔 추가")
                            
                            Text("+\(viewStore.drink.price)원")
                                .font(.footnote)
                            
                            if viewStore.count > 0 {
                                Divider()
                                
                                HStack {
                                    Spacer()
                                    
                                    Text("\(viewStore.count) 잔")
                                        .font(.footnote)
                                    
                                    Text("총 \(viewStore.drink.price * viewStore.count)원")
                                }
                            }
                        }
                        .foregroundColor(Color(.systemBackground))
                        .padding(.vertical, 32)
                        .padding(.bottom, 32)
                        .padding(.horizontal, 16)
                        .background {
                            Color("bluebottle.blue")
                                .frame(width: UIScreen.main.bounds.width)
                        }
                    }
                    .buttonStyle(.plain)
                }
                
                Button {
                    viewStore.send(.closeButtonTapped)
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.secondary)
                        .padding(20)
                }
            }
            .ignoresSafeArea(edges: [.vertical])
        }
    }
}

struct DrinkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetailView(
            store: .init(
                initialState: .init(drink: Drink.fetchDrinks()[1], count: 0),
                reducer: { DrinkReducer() }
            )
        )
    }
}
