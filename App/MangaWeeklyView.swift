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
    
    var getDayOfWeekInString: String {
        var dayInt = ""
        
        switch(pickedDayOfWeek) {
        case(0):
            dayInt = "Sunday"
        case(1):
            dayInt = "Monday"
        case(2):
            dayInt = "Tuesday"
        case(3):
            dayInt = "Wednesday"
        case(4):
            dayInt = "Thursday"
        case(5):
            dayInt = "Friday"
        case(6):
            dayInt = "Saturday"
        default:
            dayInt = ""
        }
        
        return dayInt
    }
    
    var m_ImageSizeRank2To3 = 200
    var m_ImageSizeRank4 = 150
    
    var mangaFilteredArray = [MangaUpdateDay.sunday, MangaUpdateDay.monday, MangaUpdateDay.tuesday, MangaUpdateDay.wednesday, MangaUpdateDay.thursday, MangaUpdateDay.friday, MangaUpdateDay.saturday]
    
    var filteredMangaList: [Manga] {
        return mangas.shelf.filter {
            $0.mangaUpdateDay == mangaFilteredArray[pickedDayOfWeek]
        }
    }

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
        if filteredMangaList.count == 0 {
            Text("No manga available to display from \(getDayOfWeekInString) list")
                .font(.largeTitle)
        } else {
            ScrollView(.vertical, showsIndicators: false) {
                // 最近見た
                
                //filter out the manga by the weekday
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        //use filter word here
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            VStack(alignment: .leading) {
                                    MyWeeklyItemView(manga: filteredMangaList[0], widthInt: 0, heightInt: 200)
                            }
                            LazyVGrid(columns: columnsAdaptiveRank2) {
                                ForEach(Array(filteredMangaList.enumerated()), id: \.offset) { num2, manga2 in
                                    if (num2 > 0 && num2 < 3) {
                                        MyWeeklyItemView(manga: manga2, widthInt: 0, heightInt: 100)
                                    } else if (num2 >= 3) {
                                        VStack(alignment: .leading) {
                                            MyWeeklyItemView(manga: manga2, widthInt: 0, heightInt: 100)
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
    }
}

struct MangaWeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        MangaWeeklyView(pickedDayOfWeek: .constant(0))
            .environmentObject(Mangas())
    }
}
