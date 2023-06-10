//
//  CafeRow.swift
//  BlueBottle
//
//  Created by Jaesung Lee on 2023/06/10.
//

import SwiftUI

struct CafeRow: View {
    let cafe: Cafe
    
    @State private var isExpanded: Bool = false
    @Binding var selectedCafe: Cafe?

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: cafe.imageURL)) { image in
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
                Text(cafe.name)
                    .font(.title3.bold())
                
                Text(cafe.address)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                
                Button {
                    selectedCafe = self.cafe
                    dismiss()
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
                        isExpanded.toggle()
                    } label: {
                        Image(systemName: "chevron.down")
                            .font(.footnote)
                            .foregroundColor(.accentColor)
                            .rotationEffect(isExpanded ? .degrees(-180) : .zero)
                            .animation(.default, value: isExpanded)
                    }
                    
                    Text("운영시간")
                        .font(.footnote.bold())
                        .foregroundColor(.secondary)
                }
                
                if isExpanded {
                    ForEach(cafe.hours, id: \.text) {
                        Text($0.text)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }
                
                Divider()
                    .animation(.default, value: isExpanded)
                
                if let information = cafe.information {
                    Text(information) // Text("대설 및 태풍 등의 자연재해 시, 단축 영업 또는 임시 휴무")
                }
            }
            .font(.subheadline)
            .padding(.top, 20)
            .padding(.horizontal, 12)
        }
    }
}

struct CafeRow_Previews: PreviewProvider {
    static var previews: some View {
        CafeRow(cafe: Cafe.mock[0], selectedCafe: .constant(nil))
    }
}
