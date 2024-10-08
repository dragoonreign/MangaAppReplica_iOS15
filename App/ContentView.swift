//
//  ContentView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/3/24.
//

import SwiftUI



//enum Topping: String, CaseIterable, Identifiable {
//    case nuts, cookies, blueberries
//    var id: Self { self }
//}

enum Flavor: String, CaseIterable, Identifiable {
    case none, recent, favorite
    var id: Self { self }
}

extension Flavor {
    var suggestedFilter: FilterType {
        switch self {
        case .none: return .none
        case .recent: return .recentlyRead
        case .favorite: return .favorites
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
