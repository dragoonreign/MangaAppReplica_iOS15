//
//  MangaWeeklyView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/5/24.
//

import SwiftUI

struct MangaListView: View {
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
        
        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 1) {
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
                                        .frame(height: 200)
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
    }
}

struct MangaWeeklyView: View {
    @State private var selectedFlavor: Flavor = .chocolate
    @State private var suggestedTopping: Topping = .nuts
    
    @EnvironmentObject var mangas: Mangas
    
    @Binding var pickedDayOfWeek: Int
    
    var mangaFilteredArray = [MangaUpdateDay.sunday, MangaUpdateDay.monday, MangaUpdateDay.tuesday, MangaUpdateDay.wednesday, MangaUpdateDay.thursday, MangaUpdateDay.friday, MangaUpdateDay.saturday]
    
    var filteredMangaList: [Manga] {
        return mangas.shelf.filter {
            $0.mangaUpdateDay == mangaFilteredArray[pickedDayOfWeek]
        }
    }
    
    //I want array of filtered mangas [monday manga, tuesday manga, ...]

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
        ScrollView(.vertical, showsIndicators: false) {
            // 最近見た
            
            //filter out the manga by the weekday
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                        
                        //use filter word here
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(Array(filteredMangaList.enumerated()), id: \.offset) { num, manga in
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
                                        ForEach(Array(filteredMangaList.enumerated()), id: \.offset) { num2, manga in
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
                        //end of lazyvgrid
                        
                    
                }
            }
//            MangaListView()
            //vstack
//            .background(.primary)
        }
    }
}

struct MangaWeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        MangaWeeklyView(pickedDayOfWeek: .constant(0))
            .environmentObject(Mangas())
    }
}
