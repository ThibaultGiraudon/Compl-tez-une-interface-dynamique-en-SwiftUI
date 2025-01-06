//
//  DetailView.swift
//  TajMahal
//
//  Created by Thibault Giraudon on 06/01/2025.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    var dish: Dish
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color("CustomGray"))
                }
                Text(dish.name)
                Spacer()
            }
            .padding(.top)
            Spacer()
            ZStack(alignment: .topTrailing) {
                Image(dish.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                HStack {
                    ForEach(1...3, id: \.self) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .foregroundStyle(dish.ratingSpice >= $0 ? Color("CustomRed") : Color("CustomGray"))
                    }
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background {
                    Capsule()
                        .fill(.white)
                }
                .padding(12)
            }
            .padding(.bottom, 15)
            VStack(alignment: .leading, spacing: 8) {
                Text("Allergènes:")
                    .fontWeight(.bold)
                Text(dish.allergens)
                Divider()
                    .padding(.vertical, 7)
                Text("Ingrédients:")
                    .fontWeight(.bold)
                Text(dish.ingredients)
            }
            .foregroundStyle(Color("CustomGray"))
            .font(Font.system(size: 12))
            Spacer()
        }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        DetailView(dish: ViewModel().mainCourseArray[1])
    }
}
