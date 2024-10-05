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
    @State private var selectedFlavor: Flavor = .chocolate
    @State private var suggestedTopping: Topping = .nuts
    
    let manga = Manga()
    
    var body: some View {
        NavigationView {
            // banner view here
            
            ScrollView(.vertical) {
                // 新連載
                Section {
                    Picker("Flavor", selection: $selectedFlavor) {
                        ForEach(Flavor.allCases) { flavor in
                            Text(flavor.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                // all the manga here
                // initially centered content
                // ranks from 1 takes up the whole width 2-12 
                // List(mangalist) // 2-12
                
                VStack {
                    // 最近見た
                    Text("Recent")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                    HorizontalMangaSelectionView(manga: manga)
                }
                
                VStack {
                    // ジャンプ+　無料作品
                    Text("Jump+ Free Samples")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                    HorizontalMangaSelectionView(manga: manga)
                }
                
                VStack {
                    // アニメ化作品
                    Text("Recently Animated")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                    HorizontalMangaSelectionView(manga: manga)
                }
                
                VStack {
                    // 最新の読切はこちら
                    Text("Read one shots here")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                    HorizontalMangaSelectionView(manga: manga)
                }
                
                VStack {
                    // 今だけ無料
                    Text("Free for limited time")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                    HorizontalMangaSelectionView(manga: manga)
                }
            }
//            .defaultScrollAnchor(.center)
        }
            
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "tray.and.arrow.down.fill")
                }
                .badge(2)
        
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "tray.and.arrow.up.fill")
                }
        
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
                .badge("!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
