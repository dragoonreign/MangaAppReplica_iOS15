//
//  MangaWeeklyView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/5/24.
//

import SwiftUI

struct MangaWeeklyView: View {
    @EnvironmentObject var mangas: Mangas
    
    @Binding var pickedDayOfWeek: Int
    
    var m_ImageSizeRank2To3 = 200
    var m_ImageSizeRank4 = 150
    
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
    
    let columnsAdaptiveRank2 = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    let columnsAdaptiveRank4 = [
        GridItem(.adaptive(minimum: 100))
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
                                VStack(alignment: .leading) {
//                                    Button() {
                                    NavigationLink() {
                                        MangaDetailView(manga: manga)
//                                        mangas.toggleRecentlyRead(manga)
                                    } label: {
                                        // Show the image of the manga
                                        Image("US")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(minWidth: 0, maxWidth: .infinity)
                                            .frame(height: 200)
                                            .colorMultiply(manga.isRecentlyRead ? .gray : .white)
                                    }
                                    .onTapGesture {
                                        mangas.toggleRecentlyRead(manga)
                                    }
                                
                                    HStack {
                                        Image(systemName: "eye")
                                            .padding([.leading])
                                        Text("\(manga.totalViews)")
                                            .foregroundColor(.primary)
                                    }
                                    HStack {
                                        Image(systemName: "message")
                                            .padding([.leading])
                                        Text("\(manga.totalComments)")
                                            .foregroundColor(.primary)
                                    }
                                }
                                
                                LazyVGrid(columns: columnsAdaptiveRank2) {
                                    ForEach(Array(filteredMangaList.enumerated()), id: \.offset) { num2, manga2 in
                                        if (num2 > 0 && num2 < 3) {
                                            VStack(alignment: .leading) {
                                                NavigationLink() {
                                                    MangaDetailView(manga: manga)
//                                                    mangas.toggleRecentlyRead(manga2)
                                                } label: {
                                                    // Show the image of the manga
                                                    Image("US")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(minWidth: 0, maxWidth: .infinity)
                                                        .frame(height: 100)
                                                        .colorMultiply(manga2.isRecentlyRead ? .gray : .white)
                                                }
                                            
                                                HStack {
                                                    Image(systemName: "eye")
                                                        .padding([.leading])
                                                    Text("\(manga2.totalViews)")
                                                        .foregroundColor(.primary)
                                                }
                                                HStack {
                                                    Image(systemName: "message")
                                                        .padding([.leading])
                                                    Text("\(manga2.totalComments)")
                                                        .foregroundColor(.primary)
                                                }
                                            }
                                        } else if (num2 >= 3) {
                                            VStack(alignment: .leading) {
//                                                Button() {
                                                NavigationLink() {
                                                    MangaDetailView(manga: manga)
//                                                    mangas.toggleRecentlyRead(manga2)
                                                } label: {
                                                    // Show the image of the manga
                                                    Image("US")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(minWidth: 0, maxWidth: .infinity)
                                                        .frame(height: 100)
                                                        .colorMultiply(manga2.isRecentlyRead ? .gray : .white)
                                                }
                                            
                                                HStack {
                                                    Image(systemName: "eye")
                                                        .padding([.leading])
                                                    Text("\(manga2.totalViews)")
                                                        .foregroundColor(.primary)
                                                }
                                                HStack {
                                                    Image(systemName: "message")
                                                        .padding([.leading])
                                                    Text("\(manga2.totalComments)")
                                                        .foregroundColor(.primary)
                                                }
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
