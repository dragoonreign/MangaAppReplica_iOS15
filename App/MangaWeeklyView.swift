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
//        MyCalenderView() filter out the manga by the day
        AutoScroller(imageNames: ["uk", "us", "germany", "italy", "russia", "spain", "estonia"])
        
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
