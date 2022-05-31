//
//  RecieptAppApp.swift
//  RecieptApp
//
//  Created by Мария Колупаева on 30.05.2022.
//

import SwiftUI

@main
struct RecieptAppApp: App {
    @StateObject var recipesViewModel = RecipesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipesViewModel)
        }
    }
}
