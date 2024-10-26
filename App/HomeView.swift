//
//  HomeView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/4/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var mangas: Mangas
    
    // 3 options here.
    // 1 Use client side data manager like appdata/userdata to save picked day,
    // 2 use current weekday, or
    // 3 leave it as is.
    @State var pickedDayOfWeek = 1
    
    var body: some View {
        NavigationView {
            // banner view here
            ScrollView(.vertical) {
                // 新連載
                
                // all the manga here
                // initially centered content
                // ranks from 1 takes up the whole width 2-12 
                // List(mangalist) // 2-12
                
                VStack {
                    Text("Jump+ manga list")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                    MyCalenderView(pickedDayOfWeek: $pickedDayOfWeek)
                    MangaWeeklyView(pickedDayOfWeek: $pickedDayOfWeek)
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
                    Text("Jump+ manga list")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                    MyCalenderView(pickedDayOfWeek: $pickedDayOfWeek)
                    MangaWeeklyView(pickedDayOfWeek: $pickedDayOfWeek)
                }
                .background(.black)
                
                //use array of fitered manga ex) List of monday mangas
                VStack {
                    Text("Ads")
                    AutoScrollerView(imageNames: ["UK", "US", "Germany", "Italy", "Ireland", "Spain", "Estonia"])
                }
                
                VStack {
                    // アニメ化作品
                    Text("Recently Animated")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                    HorizontalMangaSelectionView(filter: .none)
                }
                
                VStack {
                    // 最新の読切はこちら
                    Text("Read one shots here")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                    HorizontalMangaSelectionView(filter: .none)
                }
                
                VStack {
                    Text("Ads")
                    AutoScrollerView(imageNames: ["UK", "US", "Germany", "Italy", "Ireland", "Spain", "Estonia"])
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("US")
                        .ignoresSafeArea()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.red)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Mangas())
    }
}
