//
//  HomeView.swift
//  RecieptApp
//
//  Created by Мария Колупаева on 30.05.2022.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject var recipeVM: RecipesViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                RecipeList(recipes: recipeVM.recipes)
            }
            .navigationTitle("Мои рецепты")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RecipesViewModel())
    }
}
