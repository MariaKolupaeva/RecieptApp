//
//  NewRecipeView.swift
//  RecieptApp
//
//  Created by Мария Колупаева on 30.05.2022.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var showAddRecipe = false
    
    var body: some View {
        NavigationView {
            Button("Добавить новый рецепт") {
                showAddRecipe = true
            }
            .navigationTitle("Новый рецепт")
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showAddRecipe) {
            AppRecipeView()
        }
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
    }
}
