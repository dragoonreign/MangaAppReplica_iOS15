//
//  HorizontalMangaSelectionView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/4/24.
//

import SwiftUI

struct HorizontalMangaSelectionView: View {
    //get the list of manga here
    @EnvironmentObject var mangas: Mangas
    
    var body: some View {
//        VStack {
            // 最近見た
//            Text(manga.author)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .font(.largeTitle)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(mangas.shelf) { manga in
                        Button() {
                            mangas.toggleRecentlyRead(manga)
                        } label: {
                            //for testing purposes using text
                            // CHANGE: text to image
                            Image("US")
                                .resizable()
                                .frame(width: 200, height: 150)
                                .colorMultiply(manga.isRecentlyRead ? .gray : .white)
                            
//                            Text("\(manga.title)")
//                                .font(.largeTitle)
//                                .frame(width: 200, height: 150)
//                                .background(.green)
//                                .tint(manga.isRecentlyRead ? .gray : .blue)
                        }
                    }
                }
            }
//        }
    }
}

struct HorizontalMangaSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalMangaSelectionView()
            .environmentObject(Mangas())
    }
}
