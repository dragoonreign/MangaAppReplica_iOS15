//
//  ContentView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/3/24.
//

import SwiftUI

struct FreeMangaView: View {
    VStack {
        Picker("Flavor", selection: $selectedFlavor) {
            ForEach(Flavor.allCases) { flavor in
                Text(flavor.rawValue.capitalized)
            }
        }
        Picker("Topping", selection: $selectedTopping) {
            ForEach(Topping.allCases) { topping in
                Text(topping.rawValue.capitalized)
            }
        }
    }
    .pickerStyle(.segmented)
}

struct ContentView: View {
    enum Flavor: String, CaseIterable, Identifiable {
        case chocolate, vanilla, strawberry
        var id: Self { self }
    }
    
    @State private var selectedFlavor: Flavor = .chocolate

    enum Topping: String, CaseIterable, Identifiable {
        case nuts, cookies, blueberries
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


@State private var suggestedTopping: Topping = .nuts
    var body: some View {
        NavigationView {
            // banner view here
            
            ScrollView(.vertical) {
                // all the manga here
                // initially centered content
                // ranks from 1 takes up the whole width 2-12 
                // List(mangalist) // 2-12
                
                ScrollView(.horizontal) {
                    // 新連載
                }
    
                ScrollView(.horizontal) {
                    // 最近見た
                }
    
                ScrollView(.horizontal) {
                    // ジャンプ+　無料作品
                    //　same as the top scroll view
                }
    
                ScrollView(.horizontal) {
                    // アニメ化作品
                }
    
                ScrollView(.horizontal) {
                    // 最新の読切はこちら
                }
    
                ScrollView(.horizontal) {
                    // 今だけ無料
                }
            }
            .defaultScrollAnchor(.center)

        }
            
        TabView {
            Tab("Received", systemImage: "tray.and.arrow.down.fill") {
                ReceivedView()
            }
            .badge(2)
        
        
            Tab("Sent", systemImage: "tray.and.arrow.up.fill") {
                SentView()
            }
        
        
            Tab("Account", systemImage: "person.crop.circle.fill") {
                AccountView()
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
