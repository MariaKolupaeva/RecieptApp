//
//  TabBar.swift
//  RecieptApp
//
//  Created by Мария Колупаева on 30.05.2022.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Главная", systemImage: "house")
                }
            
            CategoriesView()
                .tabItem {
                    Label("Категории", systemImage: "square.fill.text.grid.1x2")
                }
            
            NewRecipeView()
                .tabItem {
                    Label("Новый рецепт", systemImage: "plus")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Любимые", systemImage: "heart")
                }
            
            SettingsView()
                .tabItem {
                    Label("Настройки", systemImage: "gear")
                }
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(RecipesViewModel())
    }
}
