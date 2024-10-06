//
//  MangaWeeklyView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/5/24.
//

import SwiftUI

struct MangaWeeklyView: View {
    @State private var selectedFlavor: Flavor = .chocolate
    @State private var suggestedTopping: Topping = .nuts
    
    @EnvironmentObject var mangas: Mangas

    let columnsFlex = [
        GridItem(.flexible(minimum: 100.0))
    ]
    
    let columnsFixed = [
        GridItem(.fixed(100.0))
    ]
    
    let columnsAdaptive = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var gridLayout = [
        GridItem()
    ]
    
    var body: some View {
//        uncomment here later
//        MyCalenderView()
        
        // 最近見た
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                ForEach(Array(mangas.shelf.enumerated()), id: \.offset) { num, manga in
                    if (num == 0) {
                        Button() {
                            mangas.toggleRecentlyRead(manga)
                        } label: {
                            // Show the image of the manga
                            Image("US")
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 200)
                                .colorMultiply(manga.isRecentlyRead ? .gray : .white)
                        }
                        
                        LazyVGrid(columns: columnsAdaptive) {
                            ForEach(Array(mangas.shelf.enumerated()), id: \.offset) { num2, manga in
                                if (num2 > 0 && num2 < 3) {
                                    Button() {
                                        mangas.toggleRecentlyRead(manga)
                                    } label: {
                                        // Show the image of the manga
                                        Image("US")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(minWidth: 0, maxWidth: .infinity)
                                            .frame(height: 250)
                                            .colorMultiply(manga.isRecentlyRead ? .gray : .white)
                                    }
                                } else if (num2 >= 3) {
                                    Button() {
                                        mangas.toggleRecentlyRead(manga)
                                    } label: {
                                        // Show the image of the manga
                                        Image("US")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(minWidth: 0, maxWidth: .infinity)
                                            .frame(height: 175)
                                            .colorMultiply(manga.isRecentlyRead ? .gray : .white)
                                    }
                                }
                            }
                        }
                        .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
                    }
                    
                    
                    
                    
//                    if (num > 3) {
//                        LazyVGrid(columns: columnsFixed) {
//                            ForEach(Array(mangas.shelf.enumerated()), id: \.offset) { num, manga in
//                                if (num > 3) {
//                                    Button() {
//                                        mangas.toggleRecentlyRead(manga)
//                                    } label: {
//                                        // Show the image of the manga
//                                        Image("US")
//                                            .resizable()
//                                            .scaledToFill()
//                                            .frame(minWidth: 0, maxWidth: .infinity)
//                                            .frame(height: 175)
//                                            .colorMultiply(manga.isRecentlyRead ? .gray : .white)
//                                    }
//                                }
//                            }
//                        }
//                        .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
//                    }
                    
//                    if (num == 0) {
//                        LazyVGrid(columns: columns) {
//                            Button() {
//                                mangas.toggleRecentlyRead(manga)
//                            } label: {
//                                // Show the image of the manga
//                                Image("US")
//                                    .resizable()
//                                    .frame(width: 400, height: 250)
//                                    .colorMultiply(manga.isRecentlyRead ? .gray : .white)
//                            }
//                        }
//                    } else if (num > 0 && num < 3) {
//                        LazyVGrid(columns: columns2) {
//                            Button() {
//                                mangas.toggleRecentlyRead(manga)
//                            } label: {
//                                // Show the image of the manga
//                                Image("US")
//                                    .resizable()
//                                    .frame(width: 200, height: 175)
//                                    .colorMultiply(manga.isRecentlyRead ? .gray : .white)
//                            }
//                        }
//                    } else {
//                        LazyVGrid(columns: columns3) {
//                            Button() {
//                                mangas.toggleRecentlyRead(manga)
//                            } label: {
//                                // Show the image of the manga
//                                Image("US")
//                                    .resizable()
//                                    .frame(width: 200, height: 100)
//                                    .colorMultiply(manga.isRecentlyRead ? .gray : .white)
//                            }
//                        }
//                    }
                }
                
            }
            //vstack
//            .background(.primary)
        }
    }
}

struct MangaWeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        MangaWeeklyView()
            .environmentObject(Mangas())
    }
}
