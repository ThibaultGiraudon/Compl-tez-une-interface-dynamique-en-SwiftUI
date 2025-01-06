//
//  Model.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import Foundation

// Cette enumération répertorie 3 niveaux de piment
enum SpiceLevel {
    case light
    case medium
    case hot
}

// Représente l'objet "plat", qui figure sur la carte du menu
struct Dish: Hashable, Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var allergens: String
    var ingredients: String
    var spiceLevel: SpiceLevel
    var ratingSpice: Int {
        switch spiceLevel {
        case .light: return 1
        case .medium: return 2
        case .hot: return 3
        }
    }
    var price: Double
    var imageName: String
}
