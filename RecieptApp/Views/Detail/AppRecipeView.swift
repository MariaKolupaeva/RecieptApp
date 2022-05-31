//
//  AppRecipeView.swift
//  RecieptApp
//
//  Created by Мария Колупаева on 31.05.2022.
//

import SwiftUI

struct AppRecipeView: View {
    @EnvironmentObject var recipeVM: RecipesViewModel
    
    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.main
    @State private var description: String = ""
    @State private var ingredients: String = ""
    @State private var directions: String = ""
    @State private var navigateToRecipe = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Название")) {
                    TextField("Название рецепта", text: $name)
                }
                Section(header: Text("Категория")) {
                    Picker("Категория", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                            
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section(header: Text("Описание")) {
                    TextEditor(text: $description)
                }
                Section(header: Text("Ингредиенты")) {
                    TextEditor(text: $ingredients)
                }
                Section(header: Text("Способ приготовления")) {
                    TextEditor(text: $directions)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Закрыть", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                ToolbarItem {
                    NavigationLink(isActive: $navigateToRecipe) {
                        RecipeView(recipe: recipeVM.recipes.sorted{ $0.datePublished > $1.datePublished }[0])
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Button {
                            saveRecipe()
                            navigateToRecipe = true
                        } label: {
                            Label("Готово", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                        }
                    }
                    .disabled(name.isEmpty)
                }
            })
            .navigationTitle("Новый рецепт")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

struct AppRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AppRecipeView()
            .environmentObject(RecipesViewModel())
    }
}

extension AppRecipeView {
    private func saveRecipe() {
        let now = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        
        let datePublished = dateFormatter.string(from: now)
        print(datePublished)
        let recipe = Recipe(name: name, image: "", description: description, ingredients: ingredients, directions: directions, category: selectedCategory.rawValue, datePublished: "")
       
        recipeVM.addRecipe(recipe: recipe)
    }
}
