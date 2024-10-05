//
//  HorizontalMangaSelectionView.swift
//  Project20(MangaAppReplica)
//
//  Created by Jun on 10/4/24.
//

import SwiftUI

struct HorizontalMangaSelectionView: View {
    let manga: Manga
    
    var body: some View {
//        VStack {
            // 最近見た
//            Text(manga.author)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .font(.largeTitle)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(1..<manga.volume) { num in
                        
                        Text("Book \(num)")
                            .font(.largeTitle)
                            .frame(width: 200, height: 150)
                            .background(.green)
                    }
                }
            }
//        }
    }
}

struct HorizontalMangaSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalMangaSelectionView(manga: Manga.example)
    }
}
