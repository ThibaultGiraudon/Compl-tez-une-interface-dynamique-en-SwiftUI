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
    
    var body: some View {
        VStack {
            Text("Menu")
                .font(Font.system(size: 23))
                .fontWeight(.bold)
            ScrollView(showsIndicators: false) {
                recipeView("Entrées", dishes: viewModel.apetizerArray)
                    .padding(.bottom, 24)
                recipeView("Plats Principaux", dishes: viewModel.mainCourseArray)
            }
        }
        .padding(20)
        .background(Color(.systemGray5))
    }
    
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
                        .padding(.top, 12)
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
