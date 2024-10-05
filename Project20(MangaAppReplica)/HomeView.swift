//
//  HomeView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/4/24.
//

import SwiftUI

struct HomeView: View {
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
