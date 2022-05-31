//
//  RecipeViewModel.swift
//  RecieptApp
//
//  Created by Мария Колупаева on 31.05.2022.
//

import Foundation

class RecipesViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe] = []
    
    init() {
        recipes = Recipe.all
    }
    
    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }
}
