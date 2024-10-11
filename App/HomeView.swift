//
//  HomeView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/4/24.
//

import SwiftUI

//let navBarAppearance = UINavigationBarAppearance()

struct HomeView: View {
    @EnvironmentObject var mangas: Mangas
    
    @State var pickedDayOfWeek = 1 // 3 options here. Use client side data manager like appdata/userdata to save picked day, use current weekday, or leave it as is. 
    
//    init() {
//        navBarAppearance.configureWithOpaqueBackground()
//        navBarAppearance.backgroundColor = .red
//
//        UINavigationBar.appearance().standardAppearance = navBarAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
//    }
    
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
                    // TEST
                    // Replace here with other
                    Text("Jump+ manga list")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                    MyCalenderView(pickedDayOfWeek: $pickedDayOfWeek)
                    MangaWeeklyView(pickedDayOfWeek: $pickedDayOfWeek)
                }
//                .background(.black)
                
                
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
                    // TEST
                    // Replace here with other
                    Text("Jump+ manga list")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                    MyCalenderView(pickedDayOfWeek: $pickedDayOfWeek)
                    MangaWeeklyView(pickedDayOfWeek: $pickedDayOfWeek)
                }
                .background(.black)
//                .preferredColorScheme(.dark)
                
                //use array of fitered manga ex) List of monday mangas
                VStack {
                    Text("Ads")
                    AutoScrollerView(imageNames: ["UK", "US", "Germany", "Italy", "Ireland", "Spain", "Estonia"])
    //                    .background(.black)
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
    //                    .background(.black)
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
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("US")
                        .ignoresSafeArea()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.red)
//                    List(){
//
//                    }
//                    .toolbarBack
//                        .resizable()
//                        .scaledToFit()
//                    Picker("Flavor", selection: $selectedFlavor) {
//                        ForEach(Flavor.allCases) { flavor in
//                            Text(flavor.rawValue.capitalized)
//                        }
//                    }
//                    .pickerStyle(.segmented)
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
