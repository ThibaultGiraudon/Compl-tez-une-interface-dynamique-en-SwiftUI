//
//  MenuView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

enum SortOrder {
    case none
    case down_spice
    case up_spice
}

// Menu sous forme de liste
struct MenuView: View {
    // Référence vers le view model qui permet d'accéder aux tableaux d'entrées et de plats du menu
    let viewModel: ViewModel = ViewModel()
    // Variable d'environement qui permet de revenir vers la page précédante
    @Environment(\.dismiss) var dismiss
    @State private var sortOrder: SortOrder = .none
    @State private var selectedFilters = [String]()
    @State private var showFilters: Bool = false
    
    var body: some View {
        ZStack {
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
                    Button(action: {
                        showFilters.toggle()
                    }) {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .fontWeight(.bold)
                            .foregroundStyle(Color("CustomDarkGray"))
                    }
                    Menu {
                        Button("Effacer") { sortOrder = .none }
                        Button {
                            sortOrder = .down_spice
                        } label: {
                            HStack {
                                Text("Épices croissant")
                                Image(systemName: sortOrder == .down_spice ? "checkmark" : "")
                            }
                        }
                        Button {
                            sortOrder = .up_spice
                        } label: {
                            HStack {
                                Text("Épices décroissant")
                                Image(systemName: sortOrder == .up_spice ? "checkmark" : "")
                            }
                        }
                    } label: {
                        Image(systemName: "arrow.up.arrow.down.circle")
                            .fontWeight(.bold)
                            .foregroundStyle(Color("CustomDarkGray"))
                    }
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
            if showFilters {
                FilterView(selectedFilters: $selectedFilters, isPresented: $showFilters)
                    .ignoresSafeArea()
            }
        }
        .background(Color("CustomLightGray"))
        .navigationBarBackButtonHidden(true)
    }
    
    // fonction pour afficher les differents type de plat sous forme de liste
    @ViewBuilder
    func recipeView(_ name: String, dishes: [Dish]) -> some View {
        let dishes: [Dish] = dishes.sorted(by: {
            switch sortOrder {
            case .none:
                return false
            case .up_spice:
                return $0.ratingSpice > $1.ratingSpice
            case .down_spice:
                return $0.ratingSpice < $1.ratingSpice
            }
        }).filter( {
            if selectedFilters.isEmpty {
                return true
            }
            for filter in selectedFilters {
                if $0.allergens.contains(filter) {
                    return false
                }
            }
            return true
        })
        VStack {
            HStack {
                Text(name)
                Spacer()
            }
            if dishes.isEmpty {
                VStack {
                    ZStack {
                        Image(systemName: "fork.knife")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(Color("CustomGray"))
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    Text("Aucune recette disponible avec les filtres choisis")
                        
                }
            } else {
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
}

#Preview {
    NavigationStack {
        MenuView()
    }
}
