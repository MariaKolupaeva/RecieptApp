//
//  FavoritesView.swift
//  RecieptApp
//
//  Created by Мария Колупаева on 30.05.2022.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationView {
            Text("Вы еще не выбрали понравшийся рецепт")
                .padding()
                .navigationTitle("Любимый рецепт")
        }
        .navigationViewStyle(.stack)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
