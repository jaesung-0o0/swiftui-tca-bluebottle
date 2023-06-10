//
//  DrinkDetailView.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/11.
//

import SwiftUI

struct DrinkDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var count: Int = 0
    let drink: Drink
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 20) {
                        AsyncImage(url: URL(string: drink.imageURL)) { image in
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
                            Text(drink.name.uppercased())
                                .font(.headline)
                            
                            Text(drink.subtitle)
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
                                
                                Text(drink.preparation)
                                    .bold()
                                
                                Button {
                                    
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
                                
                                Text(drink.calories)
                                    .bold()
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.accentColor)
                                }
                            }
                            
                            Divider()
                        }
                        
                        Text(drink.description)
                    }
                    .padding(.horizontal, 20)
                }
                
                Button {
                    count += 1
                } label: {
                    VStack(spacing: 12) {
                        Text("한 잔 추가")
                        
                        Text("+\(drink.price)원")
                            .font(.footnote)
                        
                        if count > 0 {
                            Divider()
                            
                            HStack {
                                Spacer()
                                
                                Text("\(count) 잔")
                                    .font(.footnote)
                                
                                Text("총 \(drink.price * count)원")
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
                dismiss()
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

struct DrinkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetailView(drink: Drink.fetchDrinks()[1])
    }
}
