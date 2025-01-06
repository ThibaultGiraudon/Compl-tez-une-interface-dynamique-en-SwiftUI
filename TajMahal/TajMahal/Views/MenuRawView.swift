//
//  MenuRawView.swift
//  TajMahal
//
//  Created by Thibault Giraudon on 03/01/2025.
//

import SwiftUI

struct MenuRawView: View {
    let dish: Dish
    var body: some View {
        HStack(spacing: 24) {
            Image(dish.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 112, height: 86)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack(alignment: .leading, spacing: 8) {
                Text(dish.name)
                    .font(Font.custom("PlusJakartaSans-VariableFont_wght", size: 14))
                    .lineLimit(1)
                Text(dish.description)
                    .font(Font.custom("PlusJakartaSans-VariableFont_wght", size: 12))
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 4)
                    .multilineTextAlignment(.leading)
                HStack {
                    Text("\(dish.price, format: .currency(code: "EUR"))")
                    Spacer()
                    ForEach(1...3, id: \.self) {
                        Image(systemName: "star.fill")
                            .foregroundStyle(dish.ratingSpice >= $0 ? Color("CustomRed") : .gray)
                    }
                }
            }
            .font(Font.system(size: 12))
        }
        .padding(12)
        .frame(height: 110)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
        }
    }
}

#Preview {
    MenuRawView(dish: ViewModel().apetizerArray[0])
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 20)
        .background(.yellow)
}
