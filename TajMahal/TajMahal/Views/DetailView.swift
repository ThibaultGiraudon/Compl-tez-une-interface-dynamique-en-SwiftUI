//
//  DetailView.swift
//  TajMahal
//
//  Created by Thibault Giraudon on 06/01/2025.
//

import SwiftUI

// vue detaillé du plat avec les ingrédients et allergènes
struct DetailView: View {
    // Variable d'environement qui permet de revenir vers la page précédante
    @Environment(\.dismiss) var dismiss
    var dish: Dish
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
                Text(dish.name)
                Spacer()
            }
            .font(Font.custom("PlusJakartaSans-Bold", size: 18))
            .fontWeight(.bold)
            .foregroundStyle(Color("CustomDarkGray"))
            .padding(.top)
            Spacer()
            ZStack(alignment: .topTrailing) {
                Image(dish.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                HStack {
                    ForEach(1...3, id: \.self) {
                        Image(dish.ratingSpice >= $0 ? "RedPepper" : "GrayPepper")
                            .resizable()
                            .frame(width: 14, height: 14)
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
            .font(Font.custom("PlusJakartaSans-Regular", size: 12))
            Spacer()
        }
        .padding(.horizontal, 20)
        .background(Color("OffWhite"))
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        DetailView(dish: ViewModel().mainCourseArray[1])
    }
}
