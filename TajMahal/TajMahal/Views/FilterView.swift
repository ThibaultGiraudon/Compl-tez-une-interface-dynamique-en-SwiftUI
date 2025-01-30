//
//  FilterView.swift
//  TajMahal
//
//  Created by Thibault Giraudon on 22/01/2025.
//

import SwiftUI

struct FilterView: View {
    var viewModel = ViewModel()
    @Binding var selectedFilters: [String]
    @Binding var isPresented: Bool
    @State private var localSelectedFilters: [String] = []
    var body: some View {
        ZStack(alignment: .center) {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    isPresented = false
                }
            VStack {
                Text("Retirez vos restrictions alimentaires")
                ScrollView {
                    ForEach(viewModel.allergenArray, id: \.self) { allergen in
                        Text(allergen)
                            .padding(8)
                            .background {
                                Capsule()
                                    .fill(localSelectedFilters.contains(allergen) ? .green : Color("CustomLightGray"))
                            }
                            .onTapGesture {
                                if localSelectedFilters.contains(allergen) {
                                    localSelectedFilters.removeAll { $0 == allergen }
                                } else {
                                    localSelectedFilters.append(allergen)
                                }
                            }
                    }
                }
                Button(action: {
                    selectedFilters = localSelectedFilters
                    isPresented = false
                }) {
                    Text("Apply")
                }
            }
            .frame(maxHeight: 200)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("OffWhite"))
            }
            .onAppear {
                localSelectedFilters = selectedFilters
            }
        }
    }
}
