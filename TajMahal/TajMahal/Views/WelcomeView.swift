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
                        Image("Logo.png")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .padding(.vertical, 32)
                    VStack(spacing: 14) {
                        
                        HStack {
                            Image(systemName: "clock")
                                .resizable()
                                .frame(width: 12, height: 12)
                            Text("Mardi")
                            Spacer()
                            Text("11h30 - 14h30 · 18h30 - 22h00")
                        }
                        HStack {
                            Image(systemName: "frying.pan")
                                .resizable()
                                .frame(width: 12, height: 12)
                            Text("Type de service")
                            Spacer()
                            Text("À emporter")
                        }
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .resizable()
                                .frame(width: 12, height: 12)
                            Text("12 Avenue de la Brique - 75010 Paris")
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "globe")
                                .resizable()
                                .frame(width: 12, height: 12)
                            Text("www.tajmahal.fr")
                                .tint(.gray)
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "phone")
                                .resizable()
                                .frame(width: 12, height: 12)
                            Text("06 12 34 56 78")
                            Spacer()
                        }
                        .font(Font.system(size: 14))
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
                            .fill(.red)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 32)
            }
        }
    }
}

#Preview {
    WelcomeView()
}
