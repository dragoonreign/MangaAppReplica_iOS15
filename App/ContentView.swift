//
//  ContentView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/3/24.
//

import SwiftUI

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

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars {
            print(v)
        }
        return EmptyView()
    }
}

struct ContentView: View {
//    @StateObject var mangas: [Manga] = Bundle.main.decode("mangas.json")
    
//    let collection = Mangas()
    @StateObject var mangas = Mangas()
    
    var body: some View {
        TabView {
//            HomeView(mangas: mangas)
//            Print(mangas[0])
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .badge(2)             //testing purpose no logic implemented
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
                .badge("!")           //testing purpose
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
