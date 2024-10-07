//
//  ContentView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/3/24.
//

import SwiftUI



enum Topping: String, CaseIterable, Identifiable {
    case nuts, cookies, blueberries
    var id: Self { self }
}

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}

extension Flavor {
    var suggestedTopping: Topping {
        switch self {
        case .chocolate: return .nuts
        case .vanilla: return .cookies
        case .strawberry: return .blueberries
        }
    }
}

struct ContentView: View {
    @StateObject var mangas = Mangas()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .badge(2)
                .colorScheme(.dark)
        
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
                .colorScheme(.light)
        
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
                .badge("!")
                .colorScheme(.light)
        }
        .environmentObject(mangas)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
