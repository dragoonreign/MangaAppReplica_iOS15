//
//  HomeView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/4/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedFlavor: Flavor = .chocolate
    @State private var suggestedTopping: Topping = .nuts
    
    @EnvironmentObject var mangas: Mangas
    
    var body: some View {
        NavigationView {
            // banner view here
            
            ScrollView(.vertical) {
                // 新連載
                
                // all the manga here
                // initially centered content
                // ranks from 1 takes up the whole width 2-12 
                // List(mangalist) // 2-12

                //use array of fitered manga ex) List of monday mangas
                AutoScrollerView(imageNames: ["UK", "US", "Germany", "Italy", "Ireland", "Spain", "Estonia"])
                
                VStack {
                    // TEST
                    // Replace here with other
                    Text("Jump+ manga list")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                    MangaWeeklyView()
                }
                
                VStack {
                    // 最近見た
                    Text("Recent")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                    HorizontalMangaSelectionView(filter: .recentlyRead)
                }
                
                VStack {
                    // ジャンプ+　無料作品
                    Text("Jump+ Free Samples")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                    HorizontalMangaSelectionView(filter: .none)
                }
                
                VStack {
                    // アニメ化作品
                    Text("Recently Animated")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                    HorizontalMangaSelectionView(filter: .none)
                }
                
//                VStack {
//                    // 最新の読切はこちら
//                    Text("Read one shots here")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .font(.largeTitle)
//                    HorizontalMangaSelectionView()
//                }
//
//                VStack {
//                    // 今だけ無料
//                    Text("Free for limited time")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .font(.largeTitle)
//                    HorizontalMangaSelectionView()
//                }
            }
//            .defaultScrollAnchor(.center)
//            .background(.primary)
//            .preferredColorScheme(.dark)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Mangas())
    }
}
