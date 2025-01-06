//
//  WelcomeView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

// Page d'accueil
struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("TajMahal")
                    .resizable()
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Restaurant Indien")
                            Text("Taj Mahal")
                                .fontWeight(.bold)
                                .font(Font.system(size: 23))
                        }
                        Spacer()
                        Image("Logo")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .padding(.vertical, 32)
                    VStack(spacing: 14) {
                        rawContent(image: "clock", "Mardi", "11h30 - 14h30 · 18h30 - 22h00")
                        rawContent(image: "frying.pan", "Type de service", "À emporter")
                        rawContent(image: "mappin.and.ellipse", "12 Avenue de la Brique - 75010 Paris")
                        rawContent(image: "globe", "www.tajmahal.fr")
                        rawContent(image: "phone", "06 12 34 56 78")
                    }
                    .foregroundStyle(.gray)
                }
                .font(Font.system(size: 15))
            }
            .padding(.horizontal, 18)
            Spacer()
            NavigationLink {
                MenuView()
            } label : {
                Text("Accéder au menu")
                    .fontWeight(.bold)
                    .font(Font.system(size: 20))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color("CustomRed"))
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 32)
            }
        }
    }
    
    // information restaurant
    @ViewBuilder
    func rawContent(image name: String, _ left: String, _ right: String) -> some View {
        HStack {
            Image(systemName: name)
                .resizable()
                .frame(width: 12, height: 12)
            Text(left)
            Spacer()
            Text(right)
        }
    }
    
    @ViewBuilder
    func rawContent(image name: String, _ left: String) -> some View {
        HStack {
            Image(systemName: name)
                .resizable()
                .frame(width: 12, height: 12)
            Text(left)
            Spacer()
        }
    }
}

#Preview {
    WelcomeView()
}
