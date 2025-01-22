//
//  MenuView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

// Menu sous forme de liste
struct MenuView: View {
    // Référence vers le view model qui permet d'accéder aux tableaux d'entrées et de plats du menu
    let viewModel: ViewModel = ViewModel()
    // Variable d'environement qui permet de revenir vers la page précédante
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .fontWeight(.bold)
                        .foregroundStyle(Color("CustomDarkGray"))
                }
                Spacer()
                Text("Menu")
                    .font(Font.custom("PlusJakartaSans-Bold", size: 23))
                    .fontWeight(.bold)
                    .foregroundStyle(Color("CustomDarkGray"))
                Spacer()
            }
            .padding(.top)
            Spacer()
            ScrollView(showsIndicators: false) {
                recipeView("Entrées", dishes: viewModel.apetizerArray)
                    .padding(.bottom, 24)
                recipeView("Plats Principaux", dishes: viewModel.mainCourseArray)
            }
        }
        .padding(.horizontal, 20)
        .background(Color("CustomLightGray"))
        .navigationBarBackButtonHidden(true)
    }
    
    // fonction pour afficher les differents type de plat sous forme de liste
    @ViewBuilder
    func recipeView(_ name: String, dishes: [Dish]) -> some View {
        VStack {
            HStack {
                Text(name)
                Spacer()
            }
            ForEach(dishes, id: \.self) { dish in
                NavigationLink(destination: DetailView(dish: dish)) {
                    MenuRawView(dish: dish)
                        .padding(.top, 4)
                        .foregroundStyle(Color("CustomGray"))
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MenuView()
    }
}
