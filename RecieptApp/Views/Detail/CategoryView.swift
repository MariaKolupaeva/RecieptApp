//
//  CategoryView.swift
//  RecieptApp
//
//  Created by Мария Колупаева on 31.05.2022.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var recipeVM: RecipesViewModel
    
    var category: Category
    
    // вычисляемое свойство
    
    var recipes: [Recipe] {
        return recipeVM.recipes.filter{ $0.category == category.rawValue }
    }
    
    var body: some View {
        ScrollView {
            RecipeList(recipes: recipes)
        }
        .navigationTitle(category.rawValue)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category.dessert)
            .environmentObject(RecipesViewModel())
    }
}
