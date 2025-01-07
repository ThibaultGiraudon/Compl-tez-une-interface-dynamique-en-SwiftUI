//
//  WelcomeView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

// Page d'accueil
struct WelcomeView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationStack {
            VStack {
                Image("TajMahal")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                Group {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Restaurant Indien")
                                .font(Font.custom("PlusJakartaSans-Regular", size: 14))
                            Text("Taj Mahal")
                                .fontWeight(.bold)
                                .font(Font.custom("PlusJakartaSans-Regular", size: 23))
                                .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
                        }
                        Spacer()
                        Image("GrayLogo")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .padding(.vertical, 12)
                    VStack(spacing: 14) {
                        rawContent(image: "Clock", "Mardi", "11h30 - 14h30 · 18h30 - 22h00")
                        rawContent(image: "Pan", "Type de service", "À emporter")
                        rawContent(image: "Pin", "12 Avenue de la Brique - 75010 Paris")
                        rawContent(image: "Globe", "www.tajmahal.fr")
                        rawContent(image: "Phone", "06 12 34 56 78")
                    }
                    .font(Font.custom("PlusJakartaSans-Regular", size: 14))
                }
                .font(.caption)
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
                        .padding(.top, 24)
                }
            }
            .foregroundStyle(Color("CustomGray"))
            .padding(.horizontal, 18)
            .background(Color("OffWhite"))
        }
    }
    
    // information restaurant
    @ViewBuilder
    func rawContent(image name: String, _ left: String, _ right: String) -> some View {
        HStack {
            Image(name)
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
            Image(name)
                .resizable()
                .frame(width: 12, height: 12)
            Text(left)
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        WelcomeView()
    }
}
